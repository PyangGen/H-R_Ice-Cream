import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ice_cream/auth.dart';
import 'package:ice_cream/client/home_page.dart';
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
  bool _firstError = false;
  bool _lastError = false;
  bool _emailError = false;
  bool _passwordError = false;
  bool _confirmPasswordError = false;
  final FocusNode _focusNodeFirst = FocusNode();
  final FocusNode _focusNodeLast = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  @override
  void dispose() {
    _focusNodeFirst.dispose();
    _focusNodeLast.dispose();
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // Show/hide eye for Confirm Password
    _confirmPasswordController.addListener(() {
      setState(() {
        _showConfirmPasswordEye = _confirmPasswordController.text.isNotEmpty;
      });
    });

    // Show/hide eye for Create Password
    _passwordController.addListener(() {
      setState(() {
        _showPasswordEye = _passwordController.text.isNotEmpty;
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
                      // --- First Name + Last Name Row ---
                      Row(
                        children: [
                          Expanded(
                            child: _buildInput(
                              "First Name",
                              _firstController,
                              _firstError,
                              (v) => setState(() => _firstError = v),
                              _firstBorderColor,
                              (color) =>
                                  setState(() => _firstBorderColor = color),
                              focusNode: _focusNodeFirst,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildInput(
                              "Last Name",
                              _lastController,
                              _lastError,
                              (v) => setState(() => _lastError = v),
                              _lastBorderColor,
                              (color) =>
                                  setState(() => _lastBorderColor = color),
                              focusNode: _focusNodeLast,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // --- Email Address ---
                      _buildInput(
                        "Email Address",
                        _emailController,
                        _emailError,
                        (v) => setState(() => _emailError = v),
                        _emailBorderColor,
                        (color) => setState(() => _emailBorderColor = color),
                        focusNode: _focusNodeEmail,
                      ),

                      const SizedBox(height: 16),
                      // --- Create Password ---
                      _buildInput(
                        "Create Password",
                        _passwordController,
                        _passwordError,
                        (v) => setState(() => _passwordError = v),
                        _passwordBorderColor,
                        (color) => setState(() => _passwordBorderColor = color),
                        obscureText: _obscurePassword,
                        showSuffixIcon: _showPasswordEye,
                        onSuffixIconTap: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        focusNode: _focusNodePassword,
                      ),

                      const SizedBox(height: 16),

                      // --- Confirm Password ---
                      _buildInput(
                        "Confirm Password",
                        _confirmPasswordController,
                        _confirmPasswordError,
                        (v) => setState(() => _confirmPasswordError = v),
                        _confirmPasswordBorderColor,
                        (color) =>
                            setState(() => _confirmPasswordBorderColor = color),
                        obscureText: _obscureConfirmPassword,
                        showSuffixIcon: _showConfirmPasswordEye,
                        onSuffixIconTap: () {
                          setState(() {
                            _obscureConfirmPassword = !_obscureConfirmPassword;
                          });
                        },
                        focusNode: _focusNodeConfirmPassword,
                      ),

                      const SizedBox(height: 20),

                      // BUTTON CREATE
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _firstError = _firstController.text.isEmpty;
                              _lastError = _lastController.text.isEmpty;
                              _emailError = _emailController.text.isEmpty;
                              _passwordError = _passwordController.text.isEmpty;
                              _confirmPasswordError =
                                  _confirmPasswordController.text.isEmpty;
                            });

                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Passwords do not match"),
                                ),
                              );
                              return;
                            }

                            if (!_firstError &&
                                !_lastError &&
                                !_emailError &&
                                !_passwordError &&
                                !_confirmPasswordError) {
                              try {
                                await Auth().register(
                                  firstName: _firstController.text.trim(),
                                  lastName: _lastController.text.trim(),
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );

                                // SUCCESS → go to login
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const LoginPage(),
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      "Account created successfully!",
                                    ),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error: $e")),
                                );
                              }
                            }
                          },

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
                          onPressed: () async {
  User? user = await Auth().signInWithGoogle();

  if (user != null) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Google Sign-Up failed")),
    );
  }
},

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

  Widget _buildInput(
    String label,
    TextEditingController controller,
    bool errorFlag,
    Function(bool) onErrorChange,
    Color borderColor,
    Function(Color) onBorderChange, {
    bool obscureText = false,
    VoidCallback? onSuffixIconTap, // new
    bool showSuffixIcon = false, // new
    FocusNode? focusNode,
  }) {
    focusNode ??= FocusNode();

    focusNode.addListener(() {
      if (focusNode!.hasFocus && !errorFlag) {
        onBorderChange(const Color(0xFF4F4F4F));
      } else if (!focusNode.hasFocus && !errorFlag && controller.text.isEmpty) {
        onBorderChange(const Color(0xFFFAFAFA));
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
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
          ),
          child: TextField(
            focusNode: focusNode,
            controller: controller,
            obscureText: obscureText,
            style: const TextStyle(fontSize: 14),

            cursorHeight: 18,
            onChanged: (text) {
              if (errorFlag && text.isNotEmpty) {
                onErrorChange(false);
              }
              onBorderChange(const Color(0xFF4F4F4F));
            },
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                fontSize: 14.27,
                color: Color(0xFF727272),
              ),
              floatingLabelStyle: TextStyle(
                fontSize: 17,
                color: errorFlag
                    ? const Color(0xFFE3001C)
                    : const Color(0xFF4F4F4F),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: errorFlag ? const Color(0xFFE3001C) : borderColor,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: errorFlag ? const Color(0xFFE3001C) : borderColor,
                  width: 1,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              suffixIcon: showSuffixIcon
                  ? IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 22,
                      ),
                      onPressed: onSuffixIconTap,
                    )
                  : null,
            ),
          ),
        ),
        if (errorFlag)
          Transform.translate(
            offset: const Offset(0, 6), // moves error text UP by 4px
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 4),
              child: Text(
                "This field is required",
                style: TextStyle(fontSize: 12, color: Color(0xFFE3001C)),
              ),
            ),
          ),
      ],
    );
  }

  Color _firstBorderColor = const Color(0xFFFAFAFA);
  Color _lastBorderColor = const Color(0xFFFAFAFA);
  Color _emailBorderColor = const Color(0xFFFAFAFA);
  Color _passwordBorderColor = const Color(0xFFFAFAFA);
  Color _confirmPasswordBorderColor = const Color(0xFFFAFAFA);
}
