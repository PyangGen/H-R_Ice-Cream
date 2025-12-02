import 'package:flutter/material.dart';
import 'login_page.dart'; // or the correct file path

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;

  final TextEditingController _firstController = TextEditingController();
  final TextEditingController _lastController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureConfirmPassword = true;
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _showConfirmPasswordEye = false;

  bool _showPasswordEye = false;

  @override
  void initState() {
    super.initState();

    _confirmPasswordController.addListener(() {
      setState(() {
        _showConfirmPasswordEye = _confirmPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40),

                      // LOGO
                      Transform.translate(
                        offset: const Offset(-3, 0), // move left by 5 pixels
                        child: const Text(
                          'H&R',
                          style: TextStyle(
                            color: Color(0xFFE3001B),
                            fontSize: 36,
                            fontFamily: "NationalPark",
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0,
                            height: 0.9, // reduces space below the text
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 1,
                      ), // smaller spacing between the texts
                      Transform.translate(
                        offset: const Offset(
                          0,
                          -3,
                        ), // move ICE CREAM up by 5 pixels
                        child: const Text(
                          'ICE CREAM',
                          style: TextStyle(
                            color: Color(0xFFE3001B),
                            fontSize: 16,
                            fontFamily: "NationalPark",
                            fontWeight: FontWeight.w800,
                            letterSpacing: 2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 40),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Create your Account',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // --- First Name + Last Name Row ---
                      Row(
                        children: [
                          Expanded(
                            child: _buildInput("First Name", _firstController),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildInput("Last Name", _lastController),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // EMAIL
                      _buildInput("Email Address", _emailController),
                      const SizedBox(height: 16),

                      // PASSWORD
                      Container(
                        decoration: _shadowBox(),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: const TextStyle(fontSize: 14), // <<< MATCH
                          cursorColor: const Color(0xFFE3001C),
                          cursorHeight: 18,
                          decoration: InputDecoration(
                            hintText: "Create Password",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                            ), // <<< MATCH
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: _showPasswordEye
                                ? IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: 22,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword = !_obscurePassword;
                                      });
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // CONFIRM PASSWORD
                      Container(
                        decoration: _shadowBox(),
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: _obscureConfirmPassword,
                          style: const TextStyle(fontSize: 14), // <<< MATCH
                          cursorColor: const Color(0xFFE3001C),
                          cursorHeight: 18,
                          decoration: InputDecoration(
                            hintText: "Confirm Password",
                            hintStyle: const TextStyle(
                              fontSize: 14,
                            ), // <<< MATCH
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: _showConfirmPasswordEye
                                ? IconButton(
                                    icon: Icon(
                                      _obscureConfirmPassword
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined,
                                      size: 22,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPassword =
                                            !_obscureConfirmPassword;
                                      });
                                    },
                                  )
                                : null,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // BUTTON CREATE
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE3001C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Create",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // DIVIDER
                      Row(
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text("Or, Sign Up with"),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 30),

                      // GOOGLE BUTTON
                      SizedBox(
                        height: 55,
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/client/images/CL_page/google.png',
                                height: 32,
                                width: 32,
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                "Sign Up with Google",
                                style: TextStyle(
                                  fontSize: 14.27,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 37),

                      // Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Color(0xFFE3001C),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 0),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Shadow Box style
  BoxDecoration _shadowBox() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }

  Widget _buildInput(String hint, TextEditingController controller) {
    return Container(
      decoration: _shadowBox(),
      child: TextField(
        controller: controller,
        cursorColor: const Color(0xFFE3001C),
        cursorHeight: 18,
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
