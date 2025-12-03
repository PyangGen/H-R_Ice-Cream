import 'package:flutter/material.dart';
import 'client/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🔥 Add theme to change cursor + selection handle color
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,            // Cursor
          selectionColor: Colors.black,         // Text highlight
          selectionHandleColor: Colors.black,   // Teardrop handle
        ),
      ),

      home: const LandingPage(),
    );
  }
}
