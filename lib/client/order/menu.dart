import 'package:flutter/material.dart';
import 'package:ice_cream/client/order/cart.dart';
import 'package:ice_cream/client/order/deliverTracker.dart';
import 'package:ice_cream/client/order/manage_address.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Map<String, dynamic>? selectedItem;
  String selectedSize = "";
  String selectedCategory = "Plain Flavors"; // default selected
  int quantity = 0;
  String searchQuery = "";

  final List<Map<String, dynamic>> items = [
    {
      "name": "Strawberry",
      "price": 12.99,
      "image": "lib/client/order/images/sb.png", // small image for grid
      "big_image": "lib/client/order/images/sbB.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Vanilla",
      "price": 52.99,
      "image": "lib/client/order/images/ub.png",
      "big_image": "lib/client/order/images/ub.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Strawberry",
      "price": 65.99,
      "image": "lib/client/favorite/images/sb.png",
      "big_image": "lib/client/order/images/sbB.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Vanilla",
      "price": 12.99,
      "image": "lib/client/order/images/ub.png",
      "big_image": "lib/client/order/images/ub.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Strawberry",
      "price": 12.99,
      "image": "lib/client/favorite/images/sb.png",
      "big_image": "lib/client/order/images/sbB.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Vanilla",
      "price": 12.99,
      "image": "lib/client/order/images/ub.png",
      "big_image": "lib/client/order/images/ub.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Strawberry",
      "price": 12.99,
      "image": "lib/client/favorite/images/sb.png",
      "big_image": "lib/client/order/images/sbB.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Vanilla",
      "price": 12.99,
      "image": "lib/client/order/images/ub.png",
      "big_image": "lib/client/order/images/ub.png", // big image for top
      "category": "Plain Flavors",
    },
    {
      "name": "Ube Cheese",
      "price": 12.99,
      "image": "lib/client/order/images/cc.png",
      "big_image": "lib/client/order/images/cc.png", // big image for top
      "category": "Special Flavors",
    },
    {
      "name": "Mango Graham",
      "price": 12.99,
      "image": "lib/client/order/images/mg.png",
      "big_image": "lib/client/order/images/mg.png", // big image for top
      "category": "Special Flavors",
    },
    {
      "name": "Buko Pandan",
      "price": 15.99,
      "image": "lib/client/order/images/vn.png",
      "big_image": "lib/client/order/images/vn.png", // big image for top
      "category": "Toppings",
    },
  ];

  final List<String> gallonSizes = [
    "2 gal",
    "3 gal",
    "4 gal",
    "4½ gal",
    "5 gal",
    "7 gal",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, // remove default back button
        title: showCheckout
            ? null // hide default title
            : (selectedItem == null
                  ? Container(
                      margin: const EdgeInsets.only(
                        left: 53,
                      ), // moves it LEFT a little
                      height: 43,
                      width: 140,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Text(
                        "Flavors",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15.69,
                        ),
                      ),
                    )
                  : const SizedBox()),
        flexibleSpace: showCheckout
            ? SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Brand Text with margin only
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 9,
                          left: 10,
                        ), // for the whole column
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Move H&R slightly right
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 15,
                              ), // move H&R right
                              child: Text(
                                "H&R",
                                style: TextStyle(
                                  fontFamily: "NationalPark",
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0,
                                  color: Color(0xFFE3001B),
                                ),
                              ),
                            ),
                            // Move ICE CREAM up slightly
                            Transform.translate(
                              offset: const Offset(
                                0,
                                -8,
                              ), // move up by 3 pixels
                              child: Padding(
                                padding: const EdgeInsets.only(left: 13),
                                child: Text(
                                  "ICE CREAM",
                                  style: TextStyle(
                                    fontFamily: "NationalPark",
                                    fontSize: 10,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFFE3001B),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                          right: 5,
                        ), // move left little bit
                        child: GestureDetector(
                          onTap: () => setState(() => showCheckout = false),
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
                      ),
                    ],
                  ),
                ),
              )
            : null,
        leadingWidth: 43, // ensures AppBar doesn't shrink the leading slot
        leading: showCheckout
            ? const SizedBox()
            : Transform.translate(
                offset: const Offset(20, 0), // move left by 10 pixels
                child: SizedBox(
                  child: Material(
                    color: const Color(0xFFF2F2F2),
                    shape: const CircleBorder(),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        if (selectedItem != null) {
                          setState(() {
                            selectedItem = null;
                            quantity = 0;
                            selectedSize = "";
                          });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: const Center(
                        child: Icon(
                          Icons.arrow_back,
                          size: 20,
                        ), // icon stays centered
                      ),
                    ),
                  ),
                ),
              ),

        actions: showCheckout
            ? [] // hide shopping cart
            : [
                Container(
                  margin: const EdgeInsets.only(right: 20),
                  height: 42,
                  width: 42,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2F2F2),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    icon: Image.asset(
                      "lib/client/favorite/images/shopping_cart.png",
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ],
      ),
      body: selectedItem == null ? buildGridUI() : buildStrawberryDetail(),
    );
  }

  Widget buildGridUI() {
    // Filter items by search query AND selected category
    final filteredItems = items
        .where(
          (item) =>
              item["name"].toString().toLowerCase().contains(
                searchQuery.toLowerCase(),
              ) &&
              item["category"] == selectedCategory,
        )
        .toList();

    return Column(
      children: [
        // --- SEARCH BAR ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: const Color(0xFFD9D9D9), width: 1),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xFF848484), size: 23),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    cursorColor: Colors.red,
                    style: const TextStyle(
                      fontSize: 14.18,
                      color: Color(0xFF848484),
                    ),
                    decoration: const InputDecoration(
                      hintText: "Search flavors",
                      hintStyle: TextStyle(
                        color: Color(0xFF848484),
                        fontSize: 14.18,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: (val) => setState(() => searchQuery = val),
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 8),

        // --- CATEGORY SELECTOR ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryBox("Plain Flavors"),
              _buildCategoryBox("Special Flavors"),
              _buildCategoryBox("Toppings"),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // --- GRID ---
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: GridView.builder(
              itemCount: filteredItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 177,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return GestureDetector(
                  onTap: () {
                    setState(() => selectedItem = item);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0xFFD9D9D9),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: Container(
                            height: 114.36,
                            width: double.infinity,
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  item["image"],
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topCenter,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 0,
                            left: 10,
                            right: 10,
                          ),
                          child: Text(
                            item["name"],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 8,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${item["price"]}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Image.asset(
                                "lib/client/order/images/group.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryBox(String text) {
    bool isSelected = text == selectedCategory;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = text;
        });
      },
      child: Container(
        width: 100,
        height: 38,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFE3001B) : Colors.white,
          border: Border.all(color: const Color(0xFFD9D9D9)),
          borderRadius: BorderRadius.circular(25),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF353535),
            fontSize: 12,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // ---------------- STRAWBERRY DETAIL PAGE -------------
  // -----------------------------------------------------
  Widget buildStrawberryDetail() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              // Scrollable content
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      physics:
                          MediaQuery.of(context).orientation ==
                              Orientation.portrait
                          ? const NeverScrollableScrollPhysics()
                          : const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0),
                            // IMAGE WITH HEART ICON
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.asset(
                                    selectedItem?["big_image"] ??
                                        "lib/client/order/images/sbB.png",
                                    height: 315,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),

                                Positioned(
                                  top: 26,
                                  right: 14,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.90),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      "lib/client/order/images/favorite.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedItem!["name"],
                                  style: const TextStyle(
                                    fontSize: 23.2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 22,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      "5.0",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "Select Gallon size:",
                              style: TextStyle(
                                fontSize: 13.41,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF505050),
                              ),
                            ),
                            const SizedBox(height: 14),
                            Wrap(
                              spacing: 8,
                              runSpacing: 10,
                              children: gallonSizes.map((size) {
                                return GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedSize = size),
                                  child: Container(
                                    width: 70,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selectedSize == size
                                          ? const Color(0xFFE3001B)
                                          : const Color(0xFFF5F5F5),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      size,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: selectedSize == size
                                            ? Colors.white
                                            : Colors.black87,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 13.41,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF505050),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      /// MINUS BUTTON
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity > 0) {
                                            setState(() => quantity--);
                                          }
                                        },
                                        child: Container(
                                          height: 24.57,
                                          width: 24.57,
                                          decoration: BoxDecoration(
                                            color: quantity == 0
                                                ? const Color(
                                                    0xFFAFAFAF,
                                                  ) // disabled
                                                : const Color(
                                                    0xFF1C1B1F,
                                                  ), // active
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.remove,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 20),

                                      /// QUANTITY TEXT
                                      Text(
                                        quantity.toString(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),

                                      const SizedBox(width: 20),

                                      /// ADD BUTTON
                                      GestureDetector(
                                        onTap: () {
                                          if (quantity < 5) {
                                            setState(() => quantity++);
                                          }
                                        },
                                        child: Container(
                                          height: 24.57,
                                          width: 24.57,
                                          decoration: BoxDecoration(
                                            color: quantity == 5
                                                ? const Color(
                                                    0xFFAFAFAF,
                                                  ) // disabled at max
                                                : const Color(
                                                    0xFF1C1B1F,
                                                  ), // active
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.add,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "Subtotal",
                                      style: TextStyle(
                                        fontSize: 13.39,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF848484),
                                      ),
                                    ),
                                    Text(
                                      "\$${(selectedItem!['price'] * (quantity == 0 ? 1 : quantity)).toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        fontSize: 19.35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 90),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // Bottom checkout bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          showCheckout = true;
                        });
                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Color(0xFFE3001B),
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: const Center(
                          child: Text(
                            "Check Out",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFE3001B)),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Color(0xFFE3001B),
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (showCheckout) buildCheckoutOverlay(),
        ],
      ),
    );
  }

  bool showCheckout = false;

  Widget buildCheckoutOverlay() {
    return Positioned.fill(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 8),

            // ---------- HEADER ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "My Order",
                    style: TextStyle(
                      fontSize: 17.68,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1C1B1F),
                    ),
                  ),
                  Text(
                    "6 Items",
                    style: TextStyle(fontSize: 14, color: Color(0xFF505050)),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // ---------- ITEM 1 ----------
                    buildStrawberryItem(),

                    // ---------- ITEM 2 ----------
                    buildStrawberryItem(),

                    // ---------- ITEM 3 ----------
                    buildStrawberryItem(),

                    // ---------- ITEM 4 ----------
                    buildStrawberryItem(),
                    // ---------- ITEM 4 ----------
                    buildStrawberryItem(),
                    // ---------- ITEM 4 ----------
                    buildStrawberryItem(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),

            // ---------- STICKY SUMMARY ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: const [
                  SizedBox(height: 0),
                  DashedLine(),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DELIVERY FEE", style: TextStyle(fontSize: 13)),
                      Text("0"),
                    ],
                  ),
                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "TOTAL PAYMENT",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        "\$100.00",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),

            // ---------- CONFIRM BUTTON ----------
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  // Navigate to the CheckoutPage when tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CheckoutPage()),
                  );
                },
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE3001B),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: const Center(
                    child: Text(
                      "Confirm Order",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStrawberryItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: CustomPaint(
        painter: DashedBorderPainter(
          color: const Color(0xFFD9D9D9),
          strokeWidth: 1,
          gap: 4,
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(minHeight: 90, maxHeight: 90),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "lib/client/favorite/images/sb.png",
                  height: 76,
                  width: 76,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 15),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Strawberry",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Special Flavors",
                      style: TextStyle(
                        fontSize: 12.67,
                        color: Color(0xFF898989),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 6),

                    Text(
                      "\$100",
                      style: TextStyle(
                        fontSize: 13.37,
                        color: Color(0xFFE3001B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 6, right: 4),
                      child: Image.asset(
                        "lib/client/order/images/delete2.png",
                        height: 15,
                        width: 15,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ), // small spacing between image and new text
                  const Padding(
                    padding: EdgeInsets.only(right: 4),
                    child: Text(
                      "2 gal",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF505050),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 12),
                        children: [
                          TextSpan(
                            text: "Quantity: ",
                            style: TextStyle(color: Color(0xFF898989)),
                          ),
                          TextSpan(
                            text: "1x",
                            style: TextStyle(
                              color: Color(0xFF505050),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
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
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DashedBorderPainter({
    this.color = Colors.black,
    this.strokeWidth = 1.0,
    this.gap = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(Offset.zero & size, const Radius.circular(12)),
      );

    // Draw dashed line
    final dashWidth = 5.0;
    final dashSpace = gap;
    double distance = 0.0;

    for (final pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        final len = dashWidth;
        canvas.drawPath(
          pathMetric.extractPath(distance, distance + len),
          paint,
        );
        distance += dashWidth + dashSpace;
      }
      distance = 0.0;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const DashedLine({
    this.height = 1,
    this.color = const Color(0xFFB2B2B2),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final dashWidth = 5.0;
        final dashSpace = 3.0;
        final dashCount = (constraints.maxWidth / (dashWidth + dashSpace))
            .floor();

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: height,
              child: DecoratedBox(decoration: BoxDecoration(color: color)),
            );
          }),
        );
      },
    );
  }
}

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedPayment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20, // horizontal padding
          right: 20, // horizontal padding
          bottom: 10, // vertical padding only at bottom
        ), // horizontal margin

        child: GestureDetector(
          onTap: () {
            // Add the same action as Confirm Order
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const DeliveryTrackerPage()),
            );
          },
          child: Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFE3001B),
              borderRadius: BorderRadius.circular(35),
            ),
            child: const Center(
              child: Text(
                "Place Order",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _buildSection(
              title: "Address details",
              trailing: "Edit",

              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left column: Name and phone
                  const SizedBox(width: 4),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Alma Fe Pepania",
                          style: TextStyle(
                            fontSize: 12.54,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "(+63) 9123456789",
                          style: TextStyle(
                            fontSize: 11.34,
                            color: Color(0xFF1C1B1F),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // slightly reduce space

                  // Right column: Address
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 6),
                          child: Text(
                            "ACLC COLLEGE OF MANDAUE",
                            style: TextStyle(
                              height: 0,
                              fontSize: 11,
                              color: Color(0xFF1C1B1F),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 0),
                        Padding(
                          padding: EdgeInsets.only(right: 37),
                          child: Text(
                            "BRIONES ST. MAGUIKAY",
                            style: TextStyle(
                              height: 0,
                              fontSize: 11,
                              color: Color(0xFF1C1B1F),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        SizedBox(height: 0),
                        Padding(
                          padding: EdgeInsets.only(right: 48),
                          child: Text(
                            "MANDAUE CITY, CEBU",
                            style: TextStyle(
                              height: 1.3,
                              fontSize: 11,
                              color: Color(0xFF1C1B1F),
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                ],
              ),
            ),

            _buildSection(
              title: "Delivery schedule",
              child: Transform.translate(
                offset: const Offset(0, 0), // move up a little
                child: Row(
                  children: [
                    Expanded(child: _datePicker()),
                    const SizedBox(width: 12),
                    Expanded(child: _timePicker()),
                  ],
                ),
              ),
            ),

            _buildSection(
              title: "Products Ordered",
              child: Column(
                children: [
                  // FIRST PRODUCT
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          "lib/client/order/images/sb.png",
                          width: 67,
                          height: 67,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Mango Graham",
                            style: TextStyle(
                              fontSize: 13.59,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Special Flavor",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF9D9D9D),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "\$ 100",
                            style: TextStyle(
                              fontSize: 13.37,
                              color: Color(0xFFE3001B),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "x1",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF505050),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "2 gal",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF505050),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /*      const SizedBox(height: 10), // spacing between products

        // SECOND PRODUCT (Mango Graham again)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "lib/client/order/images/sb.png",
                width: 67,
                height: 67,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Mango Graham",
                  style: TextStyle(
                    fontSize: 13.59,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Special Flavor",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9D9D9D),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "\$ 100",
                  style: TextStyle(
                    fontSize: 13.37,
                    color: Color(0xFFE3001B),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Text(
                  "x1",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF505050),
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "2 gal",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF505050),
                  ),
                ),
              ],
            ),
          ],
        ), */
                ],
              ),
            ),

            _buildSection(
              title: "Payment Method",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Dotted Line directly under title ---
                  const SizedBox(height: 4), // ← moved up (from 12 → 4)

                  LayoutBuilder(
                    builder: (context, constraints) {
                      double dotWidth = 4.1;
                      double spacing = 4;
                      int count = (constraints.maxWidth / (dotWidth + spacing))
                          .floor();

                      return Row(
                        children: List.generate(
                          count,
                          (_) => Container(
                            width: dotWidth,
                            height: 1,
                            margin: EdgeInsets.only(right: spacing),
                            color: const Color(0xFFB2B2B2),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 10,
                  ), // you can also reduce this if needed
                  // --- Payment Tiles ---
                  _paymentTile(
                    title: "Gcash",
                    subtitle: "(+63) 9123456789",
                    asset: "lib/client/order/images/gcash.png",
                    value: "gcash",
                  ),
                  const SizedBox(height: 10),
                  _paymentTile(
                    title: "Cash On Delivery",
                    asset: "lib/client/order/images/cod.png",
                    value: "cod",
                  ),
                ],
              ),
            ),
            _buildSection(
              child: Column(
                children: [
                  _summaryRow("SUBTOTAL", "\$ 300"),
                  const SizedBox(height: 6),
                  _summaryRow("DELIVERY FEE", "0"),
                  const SizedBox(height: 6),
                  _summaryRow("TOTAL PAYMENT", "\$ 300", isBold: true),
                ],
              ),
            ),

            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  // -----------------------------
  // --- Components
  // -----------------------------
  Widget _buildSection({
    String? title,
    String? trailing,
    required Widget child,
  }) {
    bool isAddress = title == "Address details";

    // Titles that must move up
    final bool moveUpTitles =
        title == "Delivery schedule" ||
        title == "Products Ordered" ||
        title == "Payment Method";

    // Correct font-weight logic
    FontWeight getFontWeight(String? txt) {
      if (txt == "Payment Method") return FontWeight.w500; // REGULAR
      if (txt == "Delivery schedule" || txt == "Products Ordered")
        return FontWeight.w700; // BOLD
      return FontWeight.w700;
    }

    return Container(
      // Horizontal margin set to 20 for all sections
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      // Padding: 10 for address, 15 for everything else including delivery schedule
      padding: EdgeInsets.all(isAddress ? 10 : 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: isAddress
            ? const Border(top: BorderSide(color: Color(0xFFE3001B), width: 8))
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Transform.translate(
              offset: moveUpTitles ? const Offset(0, -8) : Offset.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (isAddress)
                        Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Image.asset(
                            "lib/client/order/images/location_on.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 13.59,
                          fontWeight: getFontWeight(title),
                          color: isAddress
                              ? const Color(0xFFE3001B)
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  if (trailing != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 6),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ManageAddressPage(),
                            ),
                          );
                        },
                        child: Text(
                          trailing,
                          style: const TextStyle(
                            color: Color(0xFF0D6EFD),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),

          // Dotted line only for Address
          if (isAddress) ...[
            const SizedBox(height: 10),
            LayoutBuilder(
              builder: (context, constraints) {
                double dotWidth = 4.1;
                double spacing = 4;
                int count = (constraints.maxWidth / (dotWidth + spacing))
                    .floor();

                return Row(
                  children: List.generate(
                    count,
                    (_) => Container(
                      width: dotWidth,
                      height: 1,
                      margin: EdgeInsets.only(right: spacing),
                      color: const Color(0xFFB2B2B2),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
          ],

          child,
        ],
      ),
    );
  }

  // -----------------------------
  // Date Picker
  // -----------------------------
  Widget _datePicker() {
    return InkWell(
      onTap: () async {
        DateTime? date = await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFFE3001B), // header color
                  onPrimary: Colors.white, // header text color
                  surface: Colors.white, // <-- CALENDAR BACKGROUND WHITE
                  onSurface: Colors.black, // text color
                ),
              ),
              child: child!,
            );
          },
        );

        if (date != null) {
          setState(() => selectedDate = date);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.calendar_month,
              size: 20,
              color: Color(0xFF777777),
            ),
            const SizedBox(width: 12),
            Text(
              selectedDate == null
                  ? "mm/dd/yyyy"
                  : DateFormat('MM/dd/yyyy').format(selectedDate!),
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  /* Widget _datePicker() {
  return InkWell(
    onTap: () async {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF1A73E8), // Blue selected circle
                onPrimary: Colors.white,
                onSurface: Color(0xFF1A1A1A),
              ),

              // TOP BAR (Month title & arrows)
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
                iconTheme: IconThemeData(
                  color: Color(0xFF1A1A1A),
                  size: 22,
                ),
              ),

              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF1A73E8),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),

              datePickerTheme: DatePickerThemeData(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),

                // WEEKDAY LABELS (Sun, Mon, Tue...)
                weekdayStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF8A8A8A),
                ),

                // DAYS
                dayStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),

                todayForegroundColor: MaterialStateProperty.all(
                    const Color(0xFF1A73E8)),
                todayBackgroundColor:
                    MaterialStateProperty.all(Colors.transparent),

                // SELECTED DAY CIRCLE
                dayForegroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.white;
                  }
                  return const Color(0xFF1A1A1A);
                }),
                dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color(0xFF1A73E8);
                  }
                  return Colors.transparent;
                }),
              ),
            ),
            child: child!,
          );
        },
      );

      if (date != null) setState(() => selectedDate = date);
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            size: 20,
            color: Color(0xFF777777),
          ),
          const SizedBox(width: 12),
          Text(
            selectedDate == null
                ? "mm/dd/yyyy"
                : DateFormat('MM/dd/yyyy').format(selectedDate!),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    ),
  );
} */
  // -----------------------------
  // Time Picker
  // -----------------------------
  Widget _timePicker() {
    return InkWell(
      onTap: () async {
        TimeOfDay? time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Color(0xFFE3001B),
                  onPrimary: Colors.white,
                  surface: Colors.white,
                  onSurface: Colors.black,
                ),

                // ⭐ AM / PM style FIX (compatible with older Flutter)
                timePickerTheme: TimePickerThemeData(
                  dayPeriodShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: Color(0xFFE3001B), // border red
                      width: 1.5,
                    ),
                  ),

                  // Background color for AM/PM (unselected / selected)
                  dayPeriodColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return const Color(0xFFE3001B); // selected red
                    }
                    return Colors.white; // unselected white
                  }),

                  // Text color for AM/PM (unselected / selected)
                  dayPeriodTextColor: MaterialStateColor.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return Colors.white; // selected white text
                    }
                    return Colors.black; // unselected black text
                  }),
                ),

                dialogBackgroundColor: Colors.white,
              ),
              child: child!,
            );
          },
        );

        if (time != null) setState(() => selectedTime = time);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.access_time, size: 20, color: Color(0xFF777777)),
            const SizedBox(width: 20),
            Text(
              selectedTime == null ? "00:00 --" : selectedTime!.format(context),
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentTile({
    required String title,
    String? subtitle,
    required String asset,
    required String value,
  }) {
    // Determine font weight dynamically
    FontWeight getTitleWeight() {
      if (title == "Cash On Delivery") return FontWeight.w500; // lighter
      return FontWeight.w700; // Gcash bold
    }

    bool isSelected = selectedPayment == value;

    return Row(
      children: [
        Image.asset(asset, width: 45, height: 45),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 15, fontWeight: getTitleWeight()),
            ),
            if (subtitle != null)
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF1C1B1F), fontSize: 12),
              ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() => selectedPayment = value),
          child: Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF007CFF)
                    : const Color(0xFF1C1B1F),
                width: 1.5, // thin border
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 8, // inner dot
                      height: 8,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF007CFF),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }

  // -----------------------------
  // Summary Row
  // -----------------------------
  Widget _summaryRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : null,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }
}
