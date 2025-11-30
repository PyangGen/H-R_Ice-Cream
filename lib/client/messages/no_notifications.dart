

import 'package:flutter/material.dart';
import 'package:ice_cream/client/favorite/favorite.dart';
import 'package:ice_cream/client/home_page.dart';
import 'package:ice_cream/client/order/all.dart';

class NoNotificationsPage extends StatefulWidget {
  const NoNotificationsPage({super.key});

  @override
  State<NoNotificationsPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<NoNotificationsPage> {
  int selectedTab = 0; // 0 = Chats, 1 = Notifications

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      bottomNavigationBar: _bottomNavBar(), // << added here
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            // ---------------- TOP BAR ----------------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Messages",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    child: Image.asset(
                      "lib/client/messages/images/delete.png",
                      height: 20.4,
                      width: 18.13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ---------------- TABS ----------------
            Row(
              children: [
                const SizedBox(width: 20),

                // Chats tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: selectedTab == 0
                            ? const Color(0xFFE3001B)
                            : const Color(0xFFFCE8E9), // inactive bg
                        borderRadius: BorderRadius.circular(30),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 14,
                          color: selectedTab == 0
                              ? Colors.white
                              : const Color(0xFF1C1B1F), // inactive text
                          fontWeight: selectedTab == 0
                              ? FontWeight.w400
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                // Notifications tab
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ), // add horizontal padding
                      decoration: BoxDecoration(
                        color: selectedTab == 1
                            ? const Color(0xFFE3001B)
                            : const Color(0xFFFCE8E9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          // Slightly left-shifted Text
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 0,
                              ), // moves text a bit to the left
                              child: Text(
                                "Notifications",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: selectedTab == 1
                                      ? Colors.white
                                      : const Color(0xFF1C1B1F),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 20),
              ],
            ),

            const SizedBox(height: 0),
            // ---------------- EMPTY CONTENT AREA ----------------
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image
                    Image.asset(
                      selectedTab == 1
                          ? 'lib/client/messages/images/no_notif.png'
                          : 'lib/client/messages/images/no_chat.png',
                      width: 170, // adjust size as needed
                      height: 170,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 20),

                    // First text
                    Text(
                      selectedTab == 1
                          ? 'Notifications will appear here'
                          : 'Messages will appear here',
                      style: const TextStyle(
                        fontSize: 18.22,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1C1B1F),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // Second text
                    Text(
                      selectedTab == 1
                          ? 'Watch this space for offers, updates, and more.'
                          : 'Watch this space for offers, updates, and more.',
                      style: const TextStyle(
                        fontSize: 13.66,
                        color: Color(0xFF747474),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- BOTTOM NAV BAR ----------------
  Widget _bottomNavBar() {
    return Card(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 12),
      color: Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 0,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomIcon(
              imagePath: "lib/client/order/images/home.png",
              label: "Home",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
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
              imagePath: "lib/client/messages/images/chat.png",
              label: "Messages",
              active: true,
              onTap: () {},
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
  final VoidCallback? onTap;

  const _BottomIcon({
    this.icon,
    this.imagePath,
    required this.label,
    this.active = false,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
