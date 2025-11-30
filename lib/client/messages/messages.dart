import 'package:flutter/material.dart';
import 'package:ice_cream/client/favorite/favorite.dart';
import 'package:ice_cream/client/home_page.dart';
import 'package:ice_cream/client/order/all.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
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
                    onTap: () => _showDeleteAllModal(context),
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
                                right: 10,
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

                          // Positioned Badge
                          Positioned(
                            right: -12,
                            child: Container(
                              width: 19, // smaller width
                              height: 19, // smaller height
                              decoration: BoxDecoration(
                                color: selectedTab == 1
                                    ? Colors.white
                                    : const Color(0xFFE3001B),
                                shape: BoxShape.circle,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "1",
                                style: TextStyle(
                                  color: selectedTab == 1
                                      ? const Color(0xFFE3001B)
                                      : Colors.white,
                                  fontSize: 10, // smaller font
                                  fontWeight: FontWeight.bold,
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

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  if (selectedTab == 0) ...[
                    // ----------------- CHATS -----------------
                    messageCard(
                      icon: Icons.support_agent,
                      name: "Chat Assistant",
                      message: "Yes! This is Available.",
                      time: "4 hours ago",
                    ),
                    const SizedBox(height: 10),
                    messageCard(
                      icon: Icons.person,
                      name: "+63 9123456789",
                      message: "Good day! Ma’am, I’m on at location.",
                      time: "5 hours ago",
                    ),
                    const SizedBox(height: 10),
                    messageCard(
                      icon: Icons.person,
                      name: "+63 9123456789",
                      message: "Good day! Ma’am, I’m on at location.",
                      time: "5 hours ago",
                    ),
                    const SizedBox(height: 10),
                    messageCard(
                      icon: Icons.person,
                      name: "+63 9123456789",
                      message: "Good day! Ma’am, I’m on at location.",
                      time: "5 hours ago",
                    ),
                    const SizedBox(height: 10),
                    messageCard(
                      icon: Icons.person,
                      name: "+63 9123456789",
                      message: "Good day! Ma’am, I’m on at location. Are you there?",
                      time: "5 hours ago",
                    ),
                    const SizedBox(height: 10),
                    messageCard(
                      icon: Icons.person,
                      name: "+63 9123456789",
                      message: "Good day! Ma’am, I’m on at location.",
                      time: "5 hours ago",
                    ),
                    const SizedBox(height: 10),
                  ] else ...[
                    notificationCard(
                      message:
                          "Your order Strawberry has been successfully delivered.",
                      time: "1 minute ago",
                      isFirst: true,
                    ),
                    const SizedBox(height: 13),
                    notificationCard(
                      message: "Your order Mango Graham has been cancelled.",
                      time: "4 hours ago",
                    ),
                    const SizedBox(height: 13),
                    notificationCard(
                      message: "Your personal has been updated.",
                      time: "4:15 pm",
                    ),
                    const SizedBox(height: 13),
                    notificationCard(
                      message: "Your order Ube Cheese has been cancelled.",
                      time: "6 hours ago",
                    ),
                    const SizedBox(height: 13),
                    notificationCard(
                      message: "Your order Mango Graham has been cancelled.",
                      time: "4 hours ago",
                    ),
                    const SizedBox(height: 13),
                    notificationCard(
                      message: "Your personal has been updated.",
                      time: "4:15 pm",
                    ),
                    const SizedBox(height: 13),
                    notificationCard(
                      message: "Your order Ube Cheese has been cancelled.",
                      time: "6 hours ago",
                    ),
                    const SizedBox(height: 13),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteAllModal(BuildContext context) {
    // Determine the correct title based on active tab
    String title = selectedTab == 1
        ? "Delete all notifications?"
        : "Delete all messages?";

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1C1B1F),
                ),
              ),

              const SizedBox(height: 5),

              // Subtitle
              const Text(
                "You can’t undo this later.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF747474),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 30),

              // DELETE ALL button
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  // Add your delete logic (messages or notifications)
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3001B),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Delete All",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // KEEP THEM button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "Keep Them",
                    style: TextStyle(
                      color: Color(0xFF414141),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
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

  Widget messageCard({
  required IconData icon,
  required String name,
  required String message,
  required String time,
}) {
  // Determine image path, size, and padding based on icon
  String imagePath;
  double imageWidth;
  double imageHeight;
  double containerPadding;

  if (icon == Icons.person) {
    imagePath = 'lib/client/messages/images/person.png';
    imageWidth = 18;
    imageHeight = 18;
    containerPadding = 14; // smaller circle for person
  } else {
    imagePath = 'lib/client/messages/images/nest_mini.png';
    imageWidth = 24;
    imageHeight = 24;
    containerPadding = 12; // bigger circle for support agent
  }

  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image inside circle
        Transform.translate(
          offset: const Offset(-4, 0),
          child: Container(
            padding: EdgeInsets.all(containerPadding),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE7EA),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              imagePath,
              width: imageWidth,
              height: imageHeight,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(width: 10),

        // Message container
        Expanded(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Transform.translate(
                offset: const Offset(0, -4),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 0),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF1C1B1F),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: -3,
                right: 0,
                child: Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.black45),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget notificationCard({
  required String message,
  required String time,
  bool isFirst = false,
}) {
  return Container(
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(11),
      boxShadow: isFirst
          ? [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 12,
                spreadRadius: 1,
                offset: const Offset(0, 4),
              ),
            ]
          : [],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Transform.translate(
          offset: const Offset(-4, 0),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Color(0xFFFFE7EA),
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'lib/client/messages/images/notifications_active.png',
              width: 24,
              height: 24,
            ),
          ),
        ),

        const SizedBox(width: 10),

        // FIXED PART: Column instead of Stack
        Expanded(
          child: SizedBox(
            height: 52, // fixed consistent height for all notifications
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // message
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF1C1B1F),
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // time always bottom-right
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.black45,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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