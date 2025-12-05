import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Create account + store user info in Firestore
  Future<User?> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // Store extra user info
    await _db.collection("users").doc(cred.user!.uid).set({
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "createdAt": DateTime.now(),
    });

    return cred.user;
  }

  // Login
  Future<User?> login({
    required String email,
    required String password,
  }) async {
    UserCredential cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // -------------------------
  // GOOGLE SIGN IN
  // -------------------------
  Future<User?> signInWithGoogle() async {
    try {
      // Trigger Google Sign-in dialog
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // User canceled

      // Get Google Auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create Firebase credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in Firebase
      UserCredential userCred =
          await _auth.signInWithCredential(credential);

      User? user = userCred.user;

      // Store new users to Firestore only once
      if (userCred.additionalUserInfo!.isNewUser) {
        await _db.collection("users").doc(user!.uid).set({
          "firstName": user.displayName?.split(" ").first ?? "",
          "lastName": user.displayName?.split(" ").length == 2
              ? user.displayName!.split(" ").last
              : "",
          "email": user.email,
          "createdAt": DateTime.now(),
        });
      }

      return user;
    } catch (e) {
      print("GOOGLE SIGN-IN ERROR: $e");
      return null;
    }
  }
}
