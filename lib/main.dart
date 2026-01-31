import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'client/landing_page.dart';

FirebaseAnalytics analytics = FirebaseAnalytics.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyC5C3ffVxOeqc5hfQbgXdBWSqwBFi56afI",
        authDomain: "hnr-icecream.firebaseapp.com",
        projectId: "hnr-icecream",
        storageBucket: "hnr-icecream.firebasestorage.app",
        messagingSenderId: "272780462246",
        appId: "1:272780462246:web:f6e7557056fa5e29770c67",
        measurementId: "G-NFEM6B0RBG",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  // 🔥 Analytics debug device print
  print("🔥 Firebase Analytics initialized");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Color(0xFFB3D7FF),
          selectionHandleColor: Colors.black,
        ),
      ),
      home: const LandingPage(),
    );
  }
}
 