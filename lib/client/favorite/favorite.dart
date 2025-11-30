import 'package:flutter/material.dart';
import 'package:ice_cream/client/home_page.dart';
import 'package:ice_cream/client/messages/messages.dart';
import 'package:ice_cream/client/messages/no_notifications.dart';
import 'package:ice_cream/client/order/all.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        "name": "Strawberry",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/sb.png",
        "color": const Color(0xFFFFE0E6),
      },
      {
        "name": "Ube Cheese",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/uc.png",
        "color": const Color(0xFFEDE1F5),
      },
      {
        "name": "Mango Graham",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/mg.png",
        "color": const Color(0xFFFFF2D7),
      },
      {
        "name": "Buko Pandan",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/bp.png",
        "color": const Color(0xFFE4F7E9),
      },
      {
        "name": "Vanilla",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/vl.png",
        "color": const Color(0xFFFFF3DD),
      },
      {
        "name": "Ube Macapuno",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/um.png",
        "color": const Color(0xFFEDE1F5),
      },
      {
        "name": "Strawberry",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/sb.png",
        "color": const Color(0xFFFFE0E6),
      },
      {
        "name": "Ube Cheese",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/uc.png",
        "color": const Color(0xFFEDE1F5),
      },
      {
        "name": "Mango Graham",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/mg.png",
        "color": const Color(0xFFFFF2D7),
      },
      {
        "name": "Buko Pandan",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/bp.png",
        "color": const Color(0xFFE4F7E9),
      },
      {
        "name": "Vanilla",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/vl.png",
        "color": const Color(0xFFFFF3DD),
      },
      {
        "name": "Ube Macapuno",
        "price": "\$12.99",
        "image": "lib/client/favorite/images/um.png",
        "color": const Color(0xFFEDE1F5),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, size: 22),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Container(
          height: 45,
          width: 155,
          alignment: Alignment.center, // <-- this centers the text
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "My Favorite List",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.69),
            textAlign: TextAlign.center, // optional but recommended
          ),
        ),

        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            height: 46.82, // ↓ smaller circle height
            width: 46.82, // ↓ smaller circle width
            decoration: BoxDecoration(
              color: Color(0xFFF2F2F2),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero, // removes extra empty space
              onPressed: () {},
              icon: Image.asset(
                "lib/client/favorite/images/shopping_cart.png",
                height: 20.11,
                width: 19.56,
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 187,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = items[index];

            return Container(
              margin: EdgeInsets.only(
                bottom: index >= items.length - 2
                    ? 6
                    : 0, // <-- add margin to last 2 cards
              ),
              decoration: BoxDecoration(
                color: item["color"],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ), // <-- added padding
                      child: Image.asset(
                        item["image"],
                        height: 114.36,
                        width: double.infinity, // auto-fit inside padding
                        fit: BoxFit.contain, // keeps original crisp quality
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 3, left: 10, right: 10),
                    child: Text(
                      item["name"],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item["price"],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(Icons.favorite, color: Colors.red, size: 17),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: _bottomNavBar(context),
    );
  }

  // ---------------- BOTTOM NAV ----------------
  Widget _bottomNavBar(BuildContext context) {
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
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/local_mall.png",
              label: "Order",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderHistoryPage()),
                );
              },
            ),
            _BottomIcon(
              imagePath: "lib/client/favorite/images/favorite.png",
              label: "Favorite",
              active: true,
              onTap: () {},
            ),
            _BottomIcon(
              imagePath: "lib/client/images/home_page/chat.png",
              label: "Messages",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NoNotificationsPage()),
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
