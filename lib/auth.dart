import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static bool _googleInitDone = false;

  static Future<void> _ensureGoogleInit() async {
    if (_googleInitDone) return;
    await GoogleSignIn.instance.initialize();
    _googleInitDone = true;
  }

  // ----------------------------------------------------------
  // REGISTER ACCOUNT + ANALYTICS
  // ----------------------------------------------------------
  Future<User?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    print("📡 [REGISTER] Creating account for: $email");

    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("✅ [REGISTER] Firebase Auth created: ${cred.user!.uid}");

      // Save to Firestore
      await _db.collection("users").doc(cred.user!.uid).set({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "createdAt": DateTime.now(),
      });

      print("🗂️ [REGISTER] User saved to Firestore");

      // Analytics
      await _analytics.logEvent(
        name: "register",
        parameters: {
          "email": email,
          "first_name": firstName,
        },
      );

      return cred.user;
    } catch (e) {
      print("❌ [REGISTER ERROR] $e");

      await _analytics.logEvent(
        name: "register_error",
        parameters: {"error": e.toString()},
      );

      return null;
    }
  }

  // ----------------------------------------------------------
  // LOGIN + ANALYTICS
  // ----------------------------------------------------------
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    print("📡 [LOGIN] Attempt: $email");

    try {
      UserCredential cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("✅ [LOGIN SUCCESS] UID: ${cred.user?.uid}");

      await _analytics.logLogin(loginMethod: "email_password");

      await _analytics.logEvent(
        name: "login_success",
        parameters: {"email": email},
      );

      return cred.user;
    } catch (e) {
      print("❌ [LOGIN ERROR] $e");

      await _analytics.logEvent(
        name: "login_error",
        parameters: {
          "email": email,
          "error": e.toString(),
        },
      );

      return null;
    }
  }

  // ----------------------------------------------------------
  // LOGOUT + ANALYTICS
  // ----------------------------------------------------------
  Future<void> signOut() async {
    print("🚪 [SIGN OUT] Signing out user...");

    // Analytics
    await _analytics.logEvent(name: "logout");

    // Firebase sign-out
    await _auth.signOut();

    print("✅ [SIGN OUT] Complete");
  }

  // ----------------------------------------------------------
  // GOOGLE SIGN-IN (google_sign_in 7.x)
  // ----------------------------------------------------------
  Future<User?> signInWithGoogle() async {
    print("📡 [GOOGLE SIGN-IN] Starting...");

    try {
      await _ensureGoogleInit();

      // 7.x: authenticate() returns GoogleSignInAccount or throws (e.g. on cancel)
      final GoogleSignInAccount googleUser =
          await GoogleSignIn.instance.authenticate();

      // 7.x: authentication is a sync getter (only idToken, no accessToken)
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      if (googleAuth.idToken == null) {
        print("❌ [GOOGLE] ID token is null");
        await _analytics.logEvent(
          name: "google_login_error",
          parameters: {"error": "id_token_null"},
        );
        return null;
      }

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      final UserCredential userCred =
          await _auth.signInWithCredential(credential);
      final User? user = userCred.user;

      if (user == null) {
        print("❌ [GOOGLE] Firebase returned null user");
        return null;
      }

      print("✅ [GOOGLE SUCCESS] UID: ${user.uid}");

      await _analytics.logLogin(loginMethod: "google");
      await _analytics.logEvent(
        name: "google_login_success",
        parameters: {"email": user.email ?? "unknown"},
      );

      // Create/update Firestore for new or missing Google users
      final bool isNewUser = userCred.additionalUserInfo?.isNewUser ?? false;
      final doc = await _db.collection("users").doc(user.uid).get();

      if (!doc.exists || isNewUser) {
        final String displayName = user.displayName ?? "";
        final List<String> parts = displayName.trim().split(" ");
        final String firstName = parts.isNotEmpty ? parts.first : "";
        final String lastName =
            parts.length > 1 ? parts.sublist(1).join(" ") : "";

        await _db.collection("users").doc(user.uid).set({
          "firstName": firstName,
          "lastName": lastName,
          "email": user.email ?? "",
          "createdAt": doc.data()?["createdAt"] ?? DateTime.now(),
          "updatedAt": DateTime.now(),
        }, SetOptions(merge: true));

        if (isNewUser) {
          await _analytics.logEvent(name: "google_new_user");
        }
      }

      return user;
    } on GoogleSignInException catch (e) {
      print("⚠️ [GOOGLE] Cancel or error: $e");
      await _analytics.logEvent(
        name: "google_login_error",
        parameters: {"error": e.toString()},
      );
      return null;
    } catch (e) {
      print("❌ [GOOGLE SIGN-IN ERROR] $e");
      try {
        await GoogleSignIn.instance.signOut();
        if (_auth.currentUser != null) await _auth.signOut();
      } catch (_) {}
      await _analytics.logEvent(
        name: "google_login_error",
        parameters: {"error": e.toString()},
      );
      return null;
    }
  }

}
