import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ice_cream/client/favorite/favorite.dart';
import 'package:ice_cream/client/messages/messages.dart';
import 'package:ice_cream/client/order/menu.dart';
import 'order/all.dart'; // Adjust path if needed

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int index = 0;
  bool forward = true;

  final List<String> topImages = [
    "lib/client/images/home_page/TOP1.png",
    "lib/client/images/home_page/TOP2.png",
    "lib/client/images/home_page/TOP3.png",
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (!mounted) return;

      setState(() {
        if (forward) {
          index++;
          if (index == topImages.length - 1) forward = false;
        } else {
          index--;
          if (index == 0) forward = true;
        }
      });

      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              // ---------------- PROFILE + CART ----------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 21,
                    backgroundImage: AssetImage(
                      "lib/client/images/home_page/profile.png",
                    ),
                  ),
                  Container(
                    height: 43, // gamayng increase gikan 38
                    width: 43, // gamayng increase gikan 38
                    decoration: const BoxDecoration(
                      color: Color(0xFFF2F2F2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.shopping_cart,
                      color: Color(0xFFE3001B),
                      size: 22, // optional: adjust icon size to match circle
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              // ---------------- SEARCH BAR ----------------
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(26),
                  border: Border.all(color: Color(0xFFD9D9D9), width: 1),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.search,
                      color: Color(0xFF848484),
                      size: 23,
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: TextField(
                        cursorColor: Colors.red,
                        style: const TextStyle(
                          fontSize: 14.18,
                          color: Color(0xFF848484),
                        ),
                        decoration: const InputDecoration(
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            color: Color(0xFF848484),
                            fontSize: 14.18,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // ---------------- EXPANDED CONTENT ----------------
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics:
                      MediaQuery.of(context).orientation == Orientation.portrait
                      ? NeverScrollableScrollPhysics() // ❌ No scroll on portrait
                      : AlwaysScrollableScrollPhysics(), // ✅ Scroll on landscape
                  children: [
                    const Text(
                      "Top Orders",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFE3001B),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // ---------------- AUTO SLIDING TOP IMAGES ----------------
                    Transform.translate(
                      offset: const Offset(0, -3),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SizedBox(
                              height: 180,
                              width: 376,
                              child: PageView.builder(
                                controller: _pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: topImages.length,
                                itemBuilder: (context, i) {
                                  return Image.asset(
                                    topImages[i],
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 5,
                            right: 15,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Color(0xFFE3001B),
                                minimumSize: const Size(95, 35),
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Order Now",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Flavors",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1C1B1F),
                            ),
                          ),
                          Transform.translate(
                            offset: const Offset(
                              8,
                              0,
                            ), // move "See All" 8 pixels to the right
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MenuPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "See All",
                                style: TextStyle(
                                  color: Color(0xFFE3001B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Transform.translate(
                      offset: const Offset(0, -10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _flavorCard(
                              "Cookies & Cream",
                              "lib/client/images/home_page/CC.png",
                            ),
                            const SizedBox(width: 15),
                            _flavorCard(
                              "Strawberry",
                              "lib/client/images/home_page/SB.png",
                            ),
                            const SizedBox(width: 15),
                            _flavorCard(
                              "Vanilla",
                              "lib/client/images/home_page/SB.png",
                            ),
                            const SizedBox(width: 15),
                            _flavorCard(
                              "Chocolate",
                              "lib/client/images/home_page/CC.png",
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ---------------- WE RECOMMEND ----------------
                    Transform.translate(
                      offset: const Offset(0, -4),
                      child: const Text(
                        "We Recommend",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1C1B1F),
                        ),
                      ),
                    ),

                    Transform.translate(
                      offset: const Offset(0, 2),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _recommendCard(
                              "Matcha Ice Cream",
                              "lib/client/images/home_page/MIC.png",
                            ),
                            const SizedBox(width: 15),
                            _recommendCard(
                              "Rum Raisin",
                              "lib/client/images/home_page/RR.png",
                            ),
                            const SizedBox(width: 15),
                            _recommendCard(
                              "Chocolate",
                              "lib/client/images/home_page/MIC.png",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flavorCard(String title, String img) {
    return Container(
      width: 155, // Card width stays fixed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(
        8,
      ), // Slightly smaller padding to allow more image width
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              img,
              height: 80,
              width: double
                  .infinity, // Image fills available width inside the card
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star, color: Colors.amber, size: 14),
              Icon(Icons.star_border, size: 14),
            ],
          ),
          const SizedBox(height: 4),
          const Text(
            "\$ 100",
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
          ),
        ],
      ),
    );
  }

  // ---------------- RECOMMEND CARD ----------------
  Widget _recommendCard(String title, String img) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 5,
            offset: const Offset(1, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8), // Reduced padding
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(img, height: 51, width: 50, fit: BoxFit.cover),
          ),
          const SizedBox(width: 8), // Slightly reduced spacing
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 10),
                    Icon(Icons.star, color: Colors.amber, size: 10),
                    Icon(Icons.star, color: Colors.amber, size: 10),
                    Icon(Icons.star_half, color: Colors.amber, size: 10),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  "\$ 120",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- BOTTOM NAV ----------------
  Widget _bottomNavBar() {
    return Card(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 12),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 0,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomIcon(
              imagePath: "lib/client/images/home_page/home.png",
              label: "Home",
              active: true,
              onTap: () {
                // Stay on home page
              },
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/local_mall.png",
              label: "Order",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OrderHistoryPage(),
                  ),
                );
              },
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/favorite.png",
              label: "Favorite",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FavoritePage()),
                );
              },
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/chat.png",
              label: "Messages",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MessagesPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomIcon extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final String label;
  final bool active;
  final VoidCallback? onTap; // ← added

  const _BottomIcon({
    this.icon,
    this.imagePath,
    required this.label,
    this.active = false,
    this.onTap, // ← added
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // ← call onTap when tapped
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imagePath != null)
            Image.asset(
              imagePath!,
              height: 16,
              width: 18,
              color: active ? const Color(0xFFE3001B) : const Color(0xFF969696),
              fit: BoxFit.contain,
            )
          else if (icon != null)
            Icon(
              icon,
              color: active ? const Color(0xFFE3001B) : const Color(0xFF969696),
            ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: active ? const Color(0xFFE3001B) : const Color(0xFF969696),
              fontWeight: active ? FontWeight.w700 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
