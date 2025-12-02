import 'package:flutter/material.dart';
import 'package:ice_cream/client/home_page.dart';
import 'package:ice_cream/client/landing_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                    .black87, // optional if you want to tint it like the Icon
              ),
              text: "Change password",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangePasswordPage(),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LandingPage(),
                      ),
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
              iconWidget, // use the passed widget
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
                padding: EdgeInsets.only(right: 3), // adjust value as needed
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
                  "Your password must be 6 characters",

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
                    cursorColor: const Color(0xFFE3001C),
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
                    cursorColor: const Color(0xFFE3001C),
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
                    cursorColor: const Color(0xFFE3001C),
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

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // centers the row
                  children: [
                    Transform.translate(
                      offset: const Offset(-10, 0), // << MOVE MORE LEFT
                      child: Checkbox(
                        value: keepMeLoggedIn,
                        onChanged: (value) {
                          setState(() {
                            keepMeLoggedIn = value!;
                          });
                        },
                        side: const BorderSide(
                          color: Color(0xFF717171),
                          width: 1.5,
                        ),
                        fillColor: MaterialStateProperty.resolveWith<Color>((
                          states,
                        ) {
                          if (states.contains(MaterialState.selected)) {
                            return const Color(0xFF007CFF);
                          }
                          return Colors.white;
                        }),
                        checkColor: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ), // spacing between checkbox and text
                    Transform.translate(
                      offset: const Offset(
                        -12,
                        0,
                      ), // move text 8 pixels to the left
                      child: const Text(
                        "Keep me login",
                        style: TextStyle(
                          color: Color(0xFF575757),
                          fontSize: 14.85,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 220),

             SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    onPressed: () {
      if (_isContinueEnabled) {
        // Your continue logic here
      }
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: _isContinueEnabled
          ? const Color(0xFF007CFF) // blue enabled
          : const Color(0xFF0061C7), // darker blue disabled
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    child: Text(
      "Change password",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: _isContinueEnabled
            ? Colors.white        // when 0xFF007CFF
            : const Color(0xFFA7A7A7), // when 0xFF0061C7
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

void main() {
  runApp(
    const MaterialApp(
      home: ChangePasswordPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
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



class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  String? selectedReason;

  final List<String> reasons = [
    "I no longer use this app",
    "I have another account",
    "I'm concerned about my privacy or data security",
    "I receive too many notifications or emails",
    "I found better prices or services on other platforms",
    "I'm not satisfied with the app experience",
    "Checkout or payment problems",
    "Delivery or order issues",
    "Other (please specify)",
  ];

  @override
  Widget build(BuildContext context) {
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

              const SizedBox(height: 13),

              const Text(
                "Delete account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 4),

              const Text(
                "If you need to delete an account and you're prompted to provide a reason.",
                style: TextStyle(fontSize: 15, color: Color(0xFF1C1B1F), fontWeight: FontWeight.w400),
              ),

              const SizedBox(height: 20),

              /// --- REASON OPTIONS ---
            Expanded(
              
  child: ListView.builder(
    itemCount: reasons.length,
    itemBuilder: (context, index) {
      bool isSelected = selectedReason == reasons[index];
      return Container(
        margin: const EdgeInsets.only(bottom: 7),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          minLeadingWidth: 7,

          leading: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF434343),
                width: 1,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 7, // inner dot
                      height: 7,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF434343),
                      ),
                    ),
                  )
                : null,
          ),
          title: Text(reasons[index]),
          onTap: () {
            setState(() => selectedReason = reasons[index]);
          },
        ),
      );
    },
  ),
),


              /// --- CONTINUE BUTTON ---
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedReason == null ? null : () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Text("Continue"),
                ),
              ),

           
            ],
          ),
        ),
      ),
    );
  }
}