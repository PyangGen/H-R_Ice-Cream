import 'package:flutter/material.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedTab = 0;
  final tabs = ["All", "Completed", "Processing", "Cancelled"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "Order History",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: List.generate(tabs.length, (index) {
                    final isActive = selectedTab == index;
                    Color activeColor;
                    switch (tabs[index]) {
                      case "Completed":
                        activeColor = const Color(0xFF22B345);
                        break;
                      case "Processing":
                        activeColor = const Color(0xFFFF6805);
                        break;
                      case "Cancelled":
                        activeColor = const Color(0xFFE3001B);
                        break;
                      default: // All
                        activeColor = const Color(0xFF007CFF);
                    }

                    return Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedTab = index),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isActive ? activeColor : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                color: isActive
                                    ? const Color(0xFFFAFAFA)
                                    : const Color(0xFF1C1B1F),
                                fontWeight: FontWeight.w500,
                                fontSize: 11.85,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: getOrderCards(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
/// ---------------- GET ORDER CARDS PER TAB ----------------
List<Widget> getOrderCards() {
  switch (selectedTab) {
     case 1: // Completed
      return [
        orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true, // only for Completed
        ),
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/vn.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true, // only for Completed
        ),
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/vn.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          rateColor: const Color(0xFFFFD900),
          isCompletedTab: true,
        ),
      ];
    case 2: // Processing
      return [
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
          isProcessingTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          isProcessingTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "2 gal",
          price: "\$200",
          qty: "2",
          isProcessingTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/vn.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          isProcessingTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
          isProcessingTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          isProcessingTab: true,
        ),
         orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "2 gal",
          price: "\$200",
          qty: "2",
          isProcessingTab: true,
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
          isProcessingTab: true,
        ),
      ];
    case 3: // Cancelled
      return [
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
      ];
     default: // All
      return [
        orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
        orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
        orderCard(
          img: "lib/client/order/images/mg.png",
          name: "Mango Graham",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
        orderCard(
          img: "lib/client/order/images/ub.png",
          name: "Ube Cheese",
          size: "2 gal",
          price: "\$200",
          qty: "2",
        ),
        orderCard(
          img: "lib/client/order/images/cc.png",
          name: "Cookies & Cream",
          size: "4 gal",
          price: "\$300",
          qty: "1",
        ),
      ];
  }
}

/// ---------------- ORDER CARD ----------------
Widget orderCard({
  required String img,
  required String name,
  required String size,
  required String price,
  required String qty,
  Color? rateColor,
  bool isCompletedTab = false,
  bool isProcessingTab = false, // new flag for Processing
}) {
  // Determine left button text and style
  String leftText;
  Color leftBgColor;
  Color leftTextColor;
  Color leftBorderColor = Colors.transparent;

  // Determine right button text and style
  bool showRightBtn = true;
  String rightText = "Buy Again";
  Color rightColor = const Color(0xFFF2F2F2);
  Color rightTextColor = Colors.black87;

  if (isCompletedTab) {
    leftText = "Rate";
    leftBgColor = rateColor ?? const Color(0xFFFFD900);
    leftTextColor = Colors.black;
    rightText = "Buy Again";
    rightColor = const Color(0xFFF2F2F2);
    rightTextColor = Colors.black;
  } else if (isProcessingTab) {
    leftText = "Cancel";
    leftBgColor = const Color(0xFFFFE5E9);
    leftTextColor = const Color(0xFFE3001B);

    rightText = "Track Order";
    rightColor = const Color(0xFF007CFF);
    rightTextColor = Colors.white;
  } else {
    // Default All/other tabs
    leftText = name == "Ube Cheese" ? "Cancel" : name == "Cookies & Cream" ? "Details" : "Rate";
    leftBgColor = name == "Ube Cheese"
        ? const Color(0xFFFFE5E9)
        : name == "Cookies & Cream"
            ? const Color(0xFFF2F2F2)
            : (rateColor ?? const Color(0xFFE3001B));
    leftTextColor = name == "Ube Cheese"
        ? const Color(0xFFE3001B)
        : name == "Cookies & Cream"
            ? Colors.black87
            : Colors.white;
    rightText = "Buy Again";
    rightColor = name == "Cookies & Cream" ? const Color(0xFF007CFF) : const Color(0xFFF2F2F2);
    rightTextColor = name == "Cookies & Cream" ? Colors.white : Colors.black87;
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 6),
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          spreadRadius: 1,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(img, width: 60, height: 60, fit: BoxFit.cover),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 13.64,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Quantity: $qty",
                    style: const TextStyle(
                      fontSize: 12.79,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        size,
                        style: const TextStyle(
                          fontSize: 11.96,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 11.96,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE3001B),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 81,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: leftBgColor,
                          border: Border.all(
                            color: leftBorderColor,
                            width: 1.3,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            leftText,
                            style: TextStyle(
                              color: leftTextColor,
                              fontSize: 11.96,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      if (showRightBtn) ...[
                        const SizedBox(width: 5),
                        Container(
                          height: 32,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: rightColor,
                          ),
                          child: Center(
                            child: Text(
                              rightText,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 11.96,
                                color: rightTextColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomIcon(
              imagePath: "lib/client/images/home_page/home.png",
              label: "Home",
              onTap: () {},
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/local_mall.png",
              label: "Order",
              active: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrderHistoryPage()),
                );
              },
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/favorite.png",
              label: "Favorite",
              onTap: () {},
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/chat.png",
              label: "Messages",
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
