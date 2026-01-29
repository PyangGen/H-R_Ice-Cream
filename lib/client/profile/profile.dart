import 'package:flutter/material.dart';
import 'package:ice_cream/auth.dart';
import 'package:ice_cream/client/create_page.dart';
import 'package:ice_cream/client/forgot_password.dart';
import 'package:ice_cream/client/home_page.dart';
import 'package:ice_cream/client/landing_page.dart';
import 'package:ice_cream/client/login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLandscape =
                MediaQuery.of(context).orientation == Orientation.landscape;

            if (!isLandscape) {
              // Portrait: existing behavior (Column).
              return Column(
                children: [
                  // --- Close Button (Updated) ---
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 42,
                            width: 42,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.close, size: 22),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // --- Profile Image ---
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("lib/client/profile/images/prof.png"),
                  ),

                  const SizedBox(height: 15),

                  // --- Name ---
                  const Text(
                    "Alma Fe Pepania",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1C1B1F),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // --- Setting Tiles ---
                  _settingsTile(
                    iconWidget: const Icon(
                      Icons.person_outline,
                      size: 23,
                      color: Colors.black87,
                    ),
                    text: "Account information",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ViewProfilePage(),
                        ),
                      );
                    },
                  ),
                  _settingsTile(
                    iconWidget: Image.asset(
                      "lib/client/profile/images/key.png",
                      width: 23,
                      height: 23,
                      color: Colors
                          .black87, // optional if you want to tint it like the Icon
                    ),
                    text: "Change password",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChangePPasswordPage(),
                        ),
                      );
                    },
                  ),
                  _settingsTile(
                    iconWidget: Image.asset(
                      "lib/client/profile/images/delete3.png",
                      width: 23,
                      height: 23,
                      color: Colors.black87, // optional
                    ),
                    text: "Delete account",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeleteAccount(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  // --- Logout Button ---
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFE3001B), width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () async {
                          await Auth().signOut();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => LandingPage()),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Log out",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFE3001B),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              );
            } else {
              // LANDSCAPE: Prevent bottom overflow using a ScrollView.
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        // --- Close Button (Updated) ---
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 42,
                                  width: 42,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFF2F2F2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close, size: 22),
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        // --- Profile Image ---
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage("lib/client/profile/images/prof.png"),
                        ),

                        const SizedBox(height: 15),

                        // --- Name ---
                        const Text(
                          "Alma Fe Pepania",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // --- Setting Tiles ---
                        _settingsTile(
                          iconWidget: const Icon(
                            Icons.person_outline,
                            size: 23,
                            color: Colors.black87,
                          ),
                          text: "Account information",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ViewProfilePage(),
                              ),
                            );
                          },
                        ),
                        _settingsTile(
                          iconWidget: Image.asset(
                            "lib/client/profile/images/key.png",
                            width: 23,
                            height: 23,
                            color: Colors
                                .black87,
                          ),
                          text: "Change password",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ChangePPasswordPage(),
                              ),
                            );
                          },
                        ),
                        _settingsTile(
                          iconWidget: Image.asset(
                            "lib/client/profile/images/delete3.png",
                            width: 23,
                            height: 23,
                            color: Colors.black87,
                          ),
                          text: "Delete account",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DeleteAccount(),
                              ),
                            );
                          },
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 56,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: Color(0xFFE3001B), width: 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                              onPressed: () async {
                                await Auth().signOut();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (_) => LandingPage()),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                "Log out",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xFFE3001B),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _settingsTile({
    required Widget iconWidget,
    required String text,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              iconWidget,
              const SizedBox(width: 13),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 3),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ViewProfilePage extends StatelessWidget {
  const ViewProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // PROFILE PHOTO (CENTER)
              Center(
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                    "lib/client/profile/images/prof.png", // change your asset
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // NAME ROW
              Row(
                children: [
                  Expanded(
                    child: _fieldColumn(label: "First name", value: "Alma Fe"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _fieldColumn(label: "Last name", value: "Pepania"),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // PHONE + EMAIL ROW
              Row(
                children: [
                  Expanded(
                    child: _fieldColumn(
                      label: "Phone number",
                      value: "09123456789",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _fieldColumn(
                      label: "Email address",
                      value: "pepaniapyang@gmail.com",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      backgroundColor: Color(0xFF007CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // FIELD COMPONENT
  Widget _fieldColumn({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        Container(
          height: 48,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: const Color(0xFFF3F3F3),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 1, // only one line
            overflow: TextOverflow.ellipsis, // show dots if text overflows
          ),
        ),
      ],
    );
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // PROFILE PHOTO (CENTER)
              Center(
                child: Stack(
                  children: [
                    // Profile Circle
                    CircleAvatar(
                      radius: 55,
                      backgroundImage: const AssetImage(
                        "lib/client/profile/images/prof.png",
                      ),
                    ),

                    // Edit Icon at bottom-right
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          // Handle edit tap
                        },
                        child: CircleAvatar(
                          radius: 18, // adjust size as needed
                          backgroundColor:
                              Colors.white, // optional border/background
                          child: Image.asset(
                            "lib/client/profile/images/editpic.png",
                            width: 35, // adjust size to fit
                            height: 35,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // NAME ROW
              Row(
                children: [
                  Expanded(
                    child: _EditColumn(label: "First name", value: "Alma Fe"),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _EditColumn(label: "Last name", value: "Pepania"),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // PHONE + EMAIL ROW
              Row(
                children: [
                  Expanded(
                    child: _EditColumn(
                      label: "Phone number",
                      value: "09123456789",
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _EditColumn(
                      label: "Email address",
                      value: "pepaniapyang@gmail.com",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Discard Button
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFE3001B)),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Discard",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFFE3001B),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(width: 14), // space between buttons
                  // Save Changes Button
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      backgroundColor: const Color(0xFF007CFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Save Changes",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // FIELD COMPONENT
  Widget _EditColumn({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 6),
        Container(
          height: 48,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white, // background color inside
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFFD7D7D7), // border color
              width: 1,
            ),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
            maxLines: 1, // only one line
            overflow: TextOverflow.ellipsis, // show dots if text overflows
          ),
        ),
      ],
    );
  }
}



class ChangePPasswordPage extends StatefulWidget {
  const ChangePPasswordPage({super.key});

  @override
  State<ChangePPasswordPage> createState() => _ChangePPasswordPageState();
}

class _ChangePPasswordPageState extends State<ChangePPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  bool hasText = false;

  @override
  void initState() {
    super.initState();

    // Listen to input changes
    emailController.addListener(() {
      setState(() {
        hasText = emailController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 140),

                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C1C1C),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Enter your email address to continue",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Color(0xFF505050)),
                ),

                const SizedBox(height: 40),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        blurRadius: 18,
                        spreadRadius: 2,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                    cursorWidth: 2,
                    cursorRadius: const Radius.circular(3),
                    decoration: InputDecoration(
                      hintText: "Email address",
                      hintStyle: const TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 14,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: hasText
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const OTPscode(),
                              ),
                            );
                          }
                        : null, // disabled when hasText is false
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.disabled)) {
                            return const Color(0xFFFF9CA8); // disabled color
                          }
                          return const Color(0xFFE3001B); // enabled color
                        },
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OTPscode extends StatefulWidget {
  const OTPscode({super.key});

  @override
  State<OTPscode> createState() => _OTPscodeState();
}

class _OTPscodeState extends State<OTPscode> {
  List<String> otp = ["", "", "", ""]; // store OTP digits

  bool get isFilled =>
      otp.every((digit) => digit.isNotEmpty); // check if all boxes are filled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          true, // allows the body to resize when keyboard shows
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // BACK BUTTON
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 43,
                    height: 43,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 150),
              const Text(
                "Enter OTP Code",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1C1C1C),
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "We sent code to ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF505050),
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    TextSpan(
                      text: "example@gmail.com",
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF1C1B1F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              /// OTP INPUT BOXES
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: _otpBox(index),
                  );
                }),
              ),
              const SizedBox(height: 30),

              /// CONTINUE BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: isFilled
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ChangePasswordPage(),
                            ),
                          );
                        }
                      : null, // disable button when not filled
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith<Color>((
                      states,
                    ) {
                      if (isFilled) {
                        return const Color(0xFFE3001B); // active color
                      }
                      return const Color(0xFFFF9CA7); // disabled color
                    }),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),

              /// RESEND OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Didn’t get OTP? ", style: TextStyle(fontSize: 14.85)),
                  Text(
                    "Resend OTP",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFFE3001B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _otpBox(int index) {
    return Container(
      width: 60,
      height: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        cursorColor: Colors.black,
        cursorHeight: 18,
        cursorWidth: 2,
        cursorRadius: const Radius.circular(3),
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: const InputDecoration(
          counterText: "",
          border: InputBorder.none,
        ),
        onChanged: (value) {
          setState(() => otp[index] = value);
          if (value.isNotEmpty && index < 3) {
            FocusScope.of(context).nextFocus();
          } else if (value.isEmpty && index > 0) {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}


class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();
  bool get _isContinueEnabled {
    return newPasswordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        currentPasswordController.text.isNotEmpty;
  }

  bool _obscureNewPassword = true;
  bool _obscureCurrentPassword = true;
  bool _obscureConfirmPassword = true;
  bool keepMeLoggedIn = false;
  bool _showPasswordEyee = false;
  bool _currentPasswordEyee = false;
  bool _showConfirmPasswordEyee = false;

  @override
  void initState() {
    super.initState();

    // Listener for new password field
    newPasswordController.addListener(() {
      setState(() {
        _showPasswordEyee = newPasswordController.text.isNotEmpty;
      });
    });

    // Listener for confirm password field
    confirmPasswordController.addListener(() {
      setState(() {
        _showConfirmPasswordEyee = confirmPasswordController.text.isNotEmpty;
      });
    });

    currentPasswordController.addListener(() {
      setState(() {
        _currentPasswordEyee = currentPasswordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    currentPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ), // 🔥 SAME AS FORGOT PAGE
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // 🔥 SAME BACK ARROW AS FORGOT PASSWORD PAGE
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 43,
                      height: 43,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40), // 🔥 SAME SPACING AS FORGOT PAGE

                const Text(
                  "Change password",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1C1B1F),
                  ),
                ),

                const SizedBox(height: 6),

                const Text(
                  "Your password must be at least 6 characters",

                  style: TextStyle(fontSize: 15, color: Color(0xFF1C1B1F)),
                ),

                const SizedBox(height: 30),

                // current PASSWORD
                Container(
                  decoration: _shadowBox(),
                  child: TextField(
                    controller: currentPasswordController,
                    obscureText: _obscureCurrentPassword,
                    style: const TextStyle(fontSize: 14),
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      hintText: "Current password",
                      hintStyle: const TextStyle(fontSize: 14),
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
                      suffixIcon: _currentPasswordEyee
                          ? IconButton(
                              icon: Icon(
                                _obscureCurrentPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 22,
                                color: _obscureCurrentPassword
                                    ? const Color(0xFF565656)
                                    : const Color(
                                        0xFF565656,
                                      ), // red when visible
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureCurrentPassword =
                                      !_obscureCurrentPassword;
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // new PASSWORD
                Container(
                  decoration: _shadowBox(),
                  child: TextField(
                    controller: newPasswordController,
                    obscureText: _obscureNewPassword,
                    style: const TextStyle(fontSize: 14),
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      hintText: "New password",
                      hintStyle: const TextStyle(fontSize: 14),
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
                      suffixIcon: _showPasswordEyee
                          ? IconButton(
                              icon: Icon(
                                _obscureNewPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 22,
                                color: _obscureNewPassword
                                    ? const Color(0xFF565656)
                                    : const Color(
                                        0xFF565656,
                                      ), // red when visible
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureNewPassword = !_obscureNewPassword;
                                });
                              },
                            )
                          : null,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // re-enter new PASSWORD
                Container(
                  decoration: _shadowBox(),
                  child: TextField(
                    controller: confirmPasswordController,
                    obscureText: _obscureConfirmPassword,
                    style: const TextStyle(fontSize: 14), // <<< MATCH
                    cursorColor: Colors.black,
                    cursorHeight: 18,
                    decoration: InputDecoration(
                      hintText: "Re-type new password",
                      hintStyle: const TextStyle(fontSize: 14), // <<< MATCH
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
                      suffixIcon: _showConfirmPasswordEyee
                          ? IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 22,
                                color: _obscureConfirmPassword
                                    ? const Color(0xFF565656)
                                    : const Color(
                                        0xFF565656,
                                      ), // red when visible
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

          
                const SizedBox(height: 246),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: AbsorbPointer(
                    absorbing: !_isContinueEnabled,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangeSuccessPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _isContinueEnabled
                            ? const Color(0xFFE3001B)
                            : const Color(0xFFFF9CA7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        "Change password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// Border Box style (no shadow)
BoxDecoration _shadowBox() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: const Color(0xFFA9A9A9), // dark gray border
      width: 1, // border thickness
    ),
  );
}

class ChangeSuccessPage extends StatelessWidget {
  const ChangeSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color(0xFFC5C8FF),
      body: SafeArea(
        child: isLandscape
            ? // LANDSCAPE: Fix overflow by making content scrollable and adapt image/button sizes
            SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: size.height - MediaQuery.of(context).padding.vertical,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Image.asset(
                              'lib/client/profile/images/ChangePpassword.jpg',
                              width: size.width * 0.4, // shrink image in landscape
                              height: size.height * 0.3,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text(
                              'Password changed successfully!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF804EFF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Login again',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFC5C8FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  side: const BorderSide(
                                    color: Color(0xFF282828),
                                    width: 1,
                                  ),
                                ),
                                elevation: 0,
                              ),
                              child: const Text(
                                'Keep me login',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : // PORTRAIT: Use previous behavior
            SizedBox(
                height: size.height,
                width: size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        'lib/client/profile/images/ChangePpassword.jpg',
                        width: 376,
                        height: 376,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Text(
                        'Password changed successfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 320,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF804EFF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Login again',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 320,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFC5C8FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(
                              color: Color(0xFF282828),
                              width: 1,
                            ),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Keep me login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
      ),
    );
  }
}

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  String? selectedReason;
  String? otherReasonText;

  final List<String> reasons = [
    "I no longer use this app",
    "I have another account",
    "Privacy concerns",
    "I receive too many notifications or emails",
    "I found better prices or services elsewhere",
    "I'm not satisfied with the app experience",
    "Checkout or payment problems",
    "Delivery or order issues",
    "Other (please specify)",
  ];

  @override
  Widget build(BuildContext context) {
    // Check if the "Other (please specify)" is selected
    final bool isOtherSelected = selectedReason == reasons.last;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              /// --- CUSTOM BACK BUTTON ---
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 43,
                    height: 43,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 0),

              const Text(
                "Delete account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 0),

              const Text(
                "If you need to delete an account and you're prompted to provide a reason.",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1C1B1F),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 5),

              /// --- REASON OPTIONS ---
              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(
                      reasons.length,
                      (index) {
                        bool isSelected = selectedReason == reasons[index];
                        bool showTextField = isSelected && reasons[index] == reasons.last;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedReason = reasons[index];
                              if (selectedReason != reasons.last) {
                                otherReasonText = null;
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: isSelected
                                  ? []
                                  : [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        blurRadius: 2,
                                        offset: const Offset(0, 1),
                                      ),
                                    ],
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                                  dense: true,
                                  leading: Padding(
                                    padding: const EdgeInsets.only(left: 4),
                                    child: Container(
                                      width: 14,
                                      height: 14,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: isSelected
                                              ? const Color(0xFF007CFF)
                                              : const Color(0xFF434343),
                                          width: 1,
                                        ),
                                      ),
                                      child: isSelected
                                          ? Center(
                                              child: Container(
                                                width: 7,
                                                height: 7,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color(0xFF007CFF),
                                                ),
                                              ),
                                            )
                                          : null,
                                    ),
                                  ),
                                  title: Transform.translate(
                                    offset: const Offset(-10, 0),
                                    child: Text(
                                      reasons[index],
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  minLeadingWidth: 7,
                                  onTap: null, // Handled by GestureDetector
                                ),
                                if (showTextField)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                      bottom: 10,
                                      top: 0,
                                    ),
                                    child: Transform.translate(
                                      offset: const Offset(0, -3),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            // Increased the minimum height for the box
                                            height: 70, // Slightly taller than default TextField min height (2 lines ~48)
                                            child: TextField(
                                              autofocus: true,
                                              minLines: 3, // Increased minLines from 2 to 3 for more height
                                              maxLines: 4,
                                              maxLength: 150,
                                              decoration: InputDecoration(
                                                hintText: 'Write a message here',
                                                hintStyle: const TextStyle(fontSize: 12),
                                                filled: true,
                                                fillColor: const Color(0xFFE9E9E9),
                                                border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCACACA),
                                                  ),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCACACA),
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(5),
                                                  borderSide: const BorderSide(
                                                    color: Color(0xFFCACACA),
                                                  ),
                                                ),
                                                isDense: true,
                                                counterText: "", // Hide default counter
                                              ),
                                              style: const TextStyle(fontSize: 12),
                                              onChanged: (value) {
                                                setState(() {
                                                  otherReasonText = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Positioned(
                                            right: 15, // was 8, moved further left
                                            bottom: 8,
                                            child: Text(
                                              '${(otherReasonText ?? '').length}/150',
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF7C7C7C),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              /// --- CONTINUE BUTTON ---
              SizedBox(
                width: double.infinity,
                height: 55,
                child: AbsorbPointer(
                  absorbing: selectedReason == null || (isOtherSelected && (otherReasonText == null || otherReasonText!.trim().isEmpty)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeleteConfirmPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: (selectedReason == null || (isOtherSelected && (otherReasonText == null || otherReasonText!.trim().isEmpty)))
                          ? const Color(0xFFFF9CA7)
                          : const Color(0xFFE3001B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

class DeleteConfirmPage extends StatefulWidget {
  const DeleteConfirmPage({super.key});

  @override
  State<DeleteConfirmPage> createState() => _DeleteConfirmPageState();
}

class _DeleteConfirmPageState extends State<DeleteConfirmPage> {
  bool _obscurePassword = true;
  final TextEditingController _passwordController = TextEditingController();
  bool _showPasswordEye = false;
  bool _passwordError = false;
  final FocusNode _focusNodePassword = FocusNode();
  Color _passwordBorderColor = const Color(0xFFA9A9A9);

  bool get _isDeleteEnabled => _passwordController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _showPasswordEye = _passwordController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    required bool errorFlag,
    required Function(bool) onErrorChange,
    required Color borderColor,
    required Function(Color) onBorderChange,
    required FocusNode focusNode,
    bool obscureText = false,
    bool showSuffixIcon = false,
    VoidCallback? onSuffixIconTap,
  }) {
    focusNode.addListener(() {
      if (focusNode.hasFocus && !errorFlag) {
        onBorderChange(const Color(0xFFA9A9A9));
      } else if (!focusNode.hasFocus && !errorFlag && controller.text.isEmpty) {
        onBorderChange(const Color(0xFFA9A9A9));
      }
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            focusNode: focusNode,
            obscureText: obscureText,
            style: const TextStyle(fontSize: 14),
            cursorColor: Colors.black,
            cursorHeight: 18,
            cursorWidth: 2,
            cursorRadius: const Radius.circular(3),
            onChanged: (text) {
              if (errorFlag && text.isNotEmpty) onErrorChange(false);
              onBorderChange(const Color(0xFFA9A9A9));
              setState(() {});
            },
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(
                color: Color(0xFF565656),
                fontSize: 14,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFA9A9A9), width: 1),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE3001C)),
              ),
              suffixIcon: showSuffixIcon
                  ? IconButton(
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 22,
                        color: obscureText
                            ? const Color(0xFF565656)
                            : const Color(0xFF565656),
                      ),
                      onPressed: onSuffixIconTap,
                    )
                  : null,
              errorText: errorFlag ? "Password cannot be empty" : null,
            ),
          ),
        ),
        if (errorFlag)
          const Padding(
            padding: EdgeInsets.only(left: 8, top: 3),
            child: Text(
              "Password cannot be empty",
              style: TextStyle(
                color: Color(0xFFE3001C),
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool deleteEnabled = _isDeleteEnabled;
    final orientation = MediaQuery.of(context).orientation;
    // Sizing for width
    double buttonWidth;
    double passwordBoxWidth;
    Widget buildButton({required Widget child}) {
      if (orientation == Orientation.landscape) {
        return SizedBox(width: double.infinity, height: 56, child: child);
      } else {
        return SizedBox(width: 320, height: 56, child: child);
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      resizeToAvoidBottomInset: true, // enables resizing to avoid overflow when keyboard appears
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // In landscape, let password input, delete, cancel expand to full width (minus paddings)
            final isLandscape = orientation == Orientation.landscape;
            final mainWidth = isLandscape ? double.infinity : 320.0;
            return SingleChildScrollView(
              // Add a scroll view so the content can be scrolled up when the keyboard shows.
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 12,
                // add a bit extra to ensure there's some padding below bottom buttons
              ),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - MediaQuery.of(context).padding.vertical,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      /// --- CUSTOM BACK BUTTON (same as _DeleteAccountState) ---
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 43,
                            height: 43,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      const Center(
                        child: Text(
                          "Delete account",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Please note this is permanent and can’t be undone. To confirm deleting your account, please enter your password below.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1C1B1F),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 60),
                      const Text(
                        "Please re-enter your password to delete",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1C1B1F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 15),
                      // Make password input expand to full width in landscape
                      SizedBox(
                        width: isLandscape ? double.infinity : 320,
                        child: _buildInput(
                          label: "Password",
                          controller: _passwordController,
                          errorFlag: _passwordError,
                          onErrorChange: (v) => setState(() => _passwordError = v),
                          borderColor: _passwordBorderColor,
                          onBorderChange: (color) => setState(() => _passwordBorderColor = color),
                          focusNode: _focusNodePassword,
                          showSuffixIcon: _showPasswordEye,
                          obscureText: _obscurePassword,
                          onSuffixIconTap: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      const Spacer(),
                      const SizedBox(height: 15),
                      buildButton(
                        child: ElevatedButton(
                          onPressed: deleteEnabled
                              ? () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DeleteSuccessPage(),
                                    ),
                                  );
                                }
                              : null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return const Color(0xFFFF9CA7);
                                }
                                return const Color(0xFFE3001B);
                              },
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                          ),
                          child: const Text(
                            'Delete',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      buildButton(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: const BorderSide(
                                color: Color(0xFF6C6C6C),
                                width: 1,
                              ),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
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
}

class DeleteSuccessPage extends StatelessWidget {
  const DeleteSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF), // <-- Use a blue background so white text is visible
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: size.height,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/client/profile/images/delete_success.jpg',
                    width: 376,
                    height: 376,
                  ),
                 
                  // Show the success text as white, on blue, clearly visible
                  Column(
                    children: const [
                      Text(
                        'Your account has been deleted',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1F) ,
                        ),
                      ),
                      Text(
                        'successfully!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1C1B1F),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                  SizedBox(
                    width: 170,
                    height: 57,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF007CFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Create new',
                        style: TextStyle(
                          fontSize: 16  ,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

