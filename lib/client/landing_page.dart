import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ------------------ RED TOP SECTION WITH CURVE ------------------
              ClipPath(
                clipper: BottomCurveClipper(),
                child: Container(
                  width: double.infinity,
                  height: 480,
                  color: const Color(0xFFE3001B),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        top: -13,
                        left: -8,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz1.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: -8,
                        left: 15,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz2.png',
                          width: 55,
                          height: 55,
                        ),
                      ),
                      Positioned(
                        top: -38,
                        right: 28,
                        child: Image.asset(
                          'lib/client/images/landing_page/icecream5.png',
                          width: 215,
                          height: 215,
                        ),
                      ),
                      Positioned(
                        top: -28,
                        left: 30,
                        child: Image.asset(
                          'lib/client/images/landing_page/icecream3.png',
                          width: 140,
                          height: 140,
                        ),
                      ),
                      Positioned(
                        top: -4,
                        left: 127,
                        child: Image.asset(
                          'lib/client/images/landing_page/snowing2.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Positioned(
                        top: -12,
                        right: 40,
                        child: Image.asset(
                          'lib/client/images/landing_page/icecream6.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: -3,
                        right: 0,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz6.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 15,
                        child: Image.asset(
                          'lib/client/images/landing_page/snowing4.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        right: -16,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz5.png',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 80,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz4.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 166,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz4.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Positioned(
                        top: 25,
                        right: 200,
                        child: Image.asset(
                          'lib/client/images/landing_page/icecream4.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 55,
                        right: 165,
                        child: Image.asset(
                          'lib/client/images/landing_page/snowing3.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 48,
                        left: 73,
                        child: Image.asset(
                          'lib/client/images/landing_page/froz3.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 33,
                        child: Image.asset(
                          'lib/client/images/landing_page/icecream2.png',
                          width: 50,
                          height: 50,
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: -43,
                        child: Image.asset(
                          'lib/client/images/landing_page/snowing4.png',
                          width: 90,
                          height: 90,
                        ),
                      ),
                      Positioned(
                        top: 80,
                        left: -23,
                        child: Image.asset(
                          'lib/client/images/landing_page/icecream1.png',
                          width: 90,
                          height: 90,
                        ),
                      ),

                      // ------------------ QUINJAY LOGO ------------------
                      Container(
                        width: 260,
                        height: 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Quinjay",
                              style: TextStyle(
                                fontFamily: "NationalPark",
                                fontSize: 65,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                letterSpacing: -3,
                                height: 0.9, // reduces space below the text
                              ),
                            ),
                            SizedBox(height: 15), // very small spacing
                            Text(
                              "ICE CREAM",
                              style: TextStyle(
                                fontFamily: "NationalPark",
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 4,
                                color: Colors.white,
                                height: 1, // optional
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ------------------ TEXT SECTION ------------------
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Your scoop ",
                      style: TextStyle(
                        color: Color(0xFFE3001B),
                        fontFamily: "Inter",
                        fontSize: 20.29,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    TextSpan(
                      text: "is just a click away!",
                      style: TextStyle(
                        color: Color(0xFF313131),
                        fontFamily: "Inter",
                        fontSize: 20.29,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Bringing sweetness straight to your door.",
                style: TextStyle(fontSize: 13, color: Color(0xFF313131)),
              ),

              const SizedBox(height: 40),

              // ------------------ SIMPLE ORDER NOW BUTTON ------------------
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      pageBuilder: (_, animation, __) {
                        return SlideTransition(
                          position:
                              Tween<Offset>(
                                begin: const Offset(-1, 0),
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutQuad,
                                ),
                              ),
                          child: const LoginPage(),
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  width: 294,
                  height: 63,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3001B),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Order Now",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 17.69,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// bottom curve clipper unchanged
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 20);

    path.quadraticBezierTo(
      size.width / 2,
      size.height - 130,
      size.width,
      size.height - 20,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
