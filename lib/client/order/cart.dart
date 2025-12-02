import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class CartItem {
  final String name;
  final String image;
  final int price;
  int qty;
  bool selected;

  CartItem({
    required this.name,
    required this.image,
    required this.price,
    this.qty = 1,
    this.selected = true,
  });
}

class _CartPageState extends State<CartPage> {
  List<CartItem> items = [
    CartItem(
      name: "Fun Cakes",
      image: "lib/client/order/images/sb.png",
      price: 300,
    ),
    CartItem(
      name: "Vanilla",
      image: "lib/client/order/images/sb.png",
      price: 100,
    ),
    CartItem(
      name: "Strawberry",
      image: "lib/client/order/images/sb.png",
      price: 400,
    ),
    CartItem(
      name: "Matcha",
      image: "lib/client/order/images/sb.png",
      price: 800,
      selected: false,
    ),
    CartItem(
      name: "Cookies & Cream",
      image: "lib/client/order/images/sb.png",
      price: 200,
      selected: false,
    ),
    CartItem(
      name: "Matcha",
      image: "lib/client/order/images/sb.png",
      price: 800,
      selected: false,
    ),
    CartItem(
      name: "Cookies & Cream",
      image: "lib/client/order/images/sb.png",
      price: 200,
      selected: false,
    ),
    CartItem(
      name: "Matcha",
      image: "lib/client/order/images/sb.png",
      price: 800,
      selected: false,
    ),
    CartItem(
      name: "Cookies & Cream",
      image: "lib/client/order/images/sb.png",
      price: 200,
      selected: false,
    ),
  ];

  bool get allSelected => items.every((e) => e.selected);
  double get total =>
      items.where((e) => e.selected).fold(0, (sum, e) => sum + e.qty * e.price);

  void toggleSelectAll(bool value) {
    setState(() {
      for (var item in items) {
        item.selected = value;
      }
    });
  }

  void incrementQty(int index) {
    setState(() {
      items[index].qty++;
    });
  }

  void decrementQty(int index) {
    if (items[index].qty > 1) {
      setState(() {
        items[index].qty--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leadingWidth: 56, // reduce default leading width
        leading: Transform.translate(
          offset: const Offset(15, 0), // keep right offset
          child: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                width: 43, // smaller circle
                height: 43, // smaller circle
                decoration: const BoxDecoration(
                  color: Color(0xFFF2F2F2),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20, // slightly smaller icon
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Container(
          height: 43,
          width: 140,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.69),
          ),
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(10), // keep padding
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item.image,
                              width: 75,
                              height: 77,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  "4 gal",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: Color(0xFF505050),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "\$${item.price}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Move qty buttons to top-right corner
                      Positioned(
                        bottom: 0, // adjust vertical position
                        right: 3, // adjust horizontal position
                        child: Row(
                          children: [
                            _qtyButton(Icons.remove, () => decrementQty(index)),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                item.qty.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            _qtyButton(Icons.add, () => incrementQty(index)),
                          ],
                        ),
                      ),

                      // Check circle at top-right (keep below qty buttons if needed)
                      Positioned(
                        top: 0,
                        right: 3,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              item.selected = !item.selected;
                            });
                          },
                          child: item.selected
                              ? Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFE3001B),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ),
                                )
                              : Container(
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF434343),
                                      width: 1,
                                    ), // thinner border
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // FOOTER
          Padding(
            padding: const EdgeInsets.only(
    left: 20,   // horizontal padding
    right: 20,  // horizontal padding
    bottom: 10, // vertical padding only at bottom
  ),// horizontal margin

            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ), // horizontal margin
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // --- CUSTOM CIRCLE (Select All) ---
                  GestureDetector(
                    onTap: () => toggleSelectAll(!allSelected),
                    child: allSelected
                        ? Container(
                            width: 15,
                            height: 15,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE3001B),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                          )
                        : Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF434343),
                                width: 1,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Select All",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF434343),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 38,
                        ), // move "Total" slightly left
                        child: const Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF767676),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 16.54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 23),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFE3001B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20, // adds small padding around text
                        vertical: 8,
                      ),
                      minimumSize: const Size(
                        0,
                        45,
                      ), // keep height, width will shrink
                    ),
                    child: const Text(
                      "Checkout",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE9E9E9), // background color
        ),
        child: Icon(icon, size: 11),
      ),
    );
  }
}
