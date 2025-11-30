import 'package:flutter/material.dart';
import 'package:ice_cream/client/favorite/favorite.dart';
import 'package:ice_cream/client/home_page.dart';
import 'package:ice_cream/client/messages/messages.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 18),
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
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(children: getOrderCards()),
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
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/mg.png",
            name: "Mango Graham",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/ub.png",
            name: "Ube Cheese",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/cc.png",
            name: "Cookies & Cream",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/mg.png",
            name: "Mango Graham",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/ub.png",
            name: "Ube Cheese",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/cc.png",
            name: "Cookies & Cream",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/mg.png",
            name: "Mango Graham",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
          ),
          orderCard(
            img: "lib/client/order/images/ub.png",
            name: "Ube Cheese",
            size: "4 gal",
            price: "\$300",
            qty: "1",
            isCancelledTab: true,
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
    bool isCancelledTab = false,
  }) {
    // Determine left button text and style
    String leftText;
    Color leftBgColor;
    Color leftTextColor;
    Color leftBorderColor = Colors.transparent; // defa

    // Determine right button text and style
    bool showRightBtn = true;
    String rightText = "Buy Again";
    Color rightColor = const Color(0xFFF2F2F2);
    Color rightTextColor = Colors.black87;

    if (isCompletedTab) {
      // Completed tab → Rate button
      leftText = "Rate";
      leftBgColor = rateColor ?? const Color(0xFFFFD900);
      leftTextColor = Colors.black;

      rightText = "Buy Again";
      rightColor = const Color(0xFFF2F2F2);
      rightTextColor = Colors.black87;
      showRightBtn = true;
    } else if (isProcessingTab) {
      // Processing tab → Cancel + Track Order
      leftText = "Cancel";
      leftBgColor = Colors.white;
      leftTextColor = const Color(0xFFE3001B);
      leftBorderColor = const Color(0xFFE3001B);

      rightText = "Track Order";
      rightColor = const Color(0xFF007CFF);
      rightTextColor = Colors.white;
      showRightBtn = true;
    } else if (isCancelledTab) {
      // Cancelled tab → Details + Buy Again
      leftText = "Details";
      leftBgColor = const Color(0xFFF2F2F2);
      leftTextColor = Colors.black87;

      rightText = "Buy Again";
      rightColor = const Color(0xFF007CFF);
      rightTextColor = Color(0xFFFFFFFF);
      showRightBtn = true;
    } else {
      // Default All tab
      leftText = name == "Ube Cheese"
          ? "Cancel"
          : name == "Cookies & Cream"
          ? "Details"
          : "Rate";

      leftBgColor = name == "Ube Cheese"
          ? const Color(0xFFFCE8E9)
          : name == "Cookies & Cream"
          ? const Color(0xFFF2F2F2)
          : (rateColor ?? const Color(0xFFE3001B));

      leftTextColor = name == "Ube Cheese"
          ? const Color(0xFFE3001B)
          : name == "Cookies & Cream"
          ? Colors.black87
          : Colors.white;

      // Add border only for "Cancel" in All tab
      if (selectedTab == 0 && leftText == "Cancel") {
        leftBorderColor = const Color(0xFFE3001B);
      }

      // Right button logic
      if (selectedTab == 0 && name == "Ube Cheese") {
        showRightBtn = false; // hide "Buy Again" for Ube Cheese in All tab
      } else {
        showRightBtn = true;
      }

      rightText = "Buy Again";
      rightColor = name == "Cookies & Cream"
          ? const Color(0xFF007CFF)
          : const Color(0xFFF2F2F2);
      rightTextColor = name == "Cookies & Cream"
          ? Colors.white
          : Colors.black87;
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
                        GestureDetector(
                          onTap: () {
                            if (isProcessingTab && leftText == "Cancel") {
                              showCancelOrderDialog(context);
                            }
                          },
                          child: Container(
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
              imagePath: "lib/client/order/images/shopO.png",
              label: "Order",
              active: true,
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

Future<void> showCancelOrderDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.23),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Updated image instead of X icon
              Container(
                padding: const EdgeInsets.all(1),

                child: Image.asset(
                  "lib/client/order/images/cancel.png",
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Cancel Order?",
                style: TextStyle(fontSize: 19.85, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Are you sure you want to cancel this order?",
                softWrap: false,
                maxLines: 1,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.23,
                  color: Color(0xFF5B5B5B),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // No, cancel button
                  SizedBox(
                    width: 118.75,
                    height: 43.43,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF969696)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "No, cancel",
                        style: TextStyle(
                          fontSize: 14.26,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF434343),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  SizedBox(
                    width: 118.75,
                    height: 43.43,
                    child: ElevatedButton(
                      onPressed: () {
                        // Close the cancel dialog first
                        Navigator.pop(context);

                        // Then show the success dialog
                        showSuccessDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE3001B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: Center(
                        child: const Text(
                          "Yes, I'm sure",
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontSize: 14.26,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showSuccessDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: true, // allow dismiss by tapping outside
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.83),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 30),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,

            children: [
              const SizedBox(height: 10),
              // Success image
              Container(
                padding: const EdgeInsets.all(1),
                child: Image.asset(
                  "lib/client/order/images/check_circle.png", // replace with your success image
                  width: 34,
                  height: 34,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Successfully Cancel",
                style: TextStyle(fontSize: 19.85, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your order has been successfully cancel",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.23,
                  color: Color(0xFF5B5B5B),
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      );
    },
  );
}
