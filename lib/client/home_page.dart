import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ice_cream/client/favorite/favorite.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:ice_cream/client/messages/messages.dart';
import 'package:ice_cream/client/order/cart.dart';
import 'package:ice_cream/client/order/menu.dart';
import 'package:ice_cream/client/profile/profile.dart';
import 'order/all.dart'; // Adjust path if needed

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  Timer? _autoSlideTimer;
  bool _userSwiped = false;

  /// Track current page to avoid reading PageController.page (causes assertion when multiple PageViews).
  int _topImagesCurrentPage = 0;
  int _manualSlideCurrentPage = 0;

  int index = 0;
  bool forward = true;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  final TextEditingController _searchController = TextEditingController();
  String searchText = "";

  final List<Map<String, String>> flavors = [
    {"title": "Cookies & Cream", "img": "lib/client/images/home_page/CC.png"},
    {"title": "Strawberry", "img": "lib/client/images/home_page/SB.png"},
    {"title": "Vanilla", "img": "lib/client/images/home_page/SB.png"},
    {"title": "Chocolate", "img": "lib/client/images/home_page/CC.png"},
  ];

  List<Map<String, String>> get filteredFlavors {
    return flavors
        .where(
          (item) =>
              item["title"]!.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();
  }

  final List<String> topImages = [
    "lib/client/images/home_page/sb.jpg",
    "lib/client/images/home_page/cc.jpg",
    "lib/client/images/home_page/pandan.jpg",
  ];

  final List<String> topNames = [
    "Strawberry Flavor",
    "Vanilla Flavor",
    "Mango Graham Flavor",
  ];

  /// Different rating for each top image (aligned with topNames).
  final List<String> topRatings = ["4.8", "4.9", "5.0"];

  /// Manual slideshow below Popular (same style as top, no auto-slide).
  final List<String> manualSlideImages = [
    "lib/client/images/home_page/cc.jpg",
    "lib/client/images/home_page/MIC.png",
    "lib/client/images/home_page/sb.jpg",
  ];
  final List<String> manualSlideNames = [
    "Matcha",
    "Strawberry ",
    "Ube Cheese",
  ];
  final List<String> manualSlidePrices = [
    "₱1,700",
    "₱1,500",
    "₱1,900",
  ];
  /// Map Popular slide index -> menu item index (for tap-to-open).
  static const List<int> manualSlideToMenuIndex = [0, 0, 7]; // Matcha, Strawberry, Ube Cheese
  final PageController _manualSlideController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onTopImagesPageChanged);
    _manualSlideController.addListener(_onManualSlidePageChanged);

    // Advance topImages to next every 20 seconds
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted) return;
      if (_userSwiped) return;
      if (!_pageController.hasClients) return;

      int next = _topImagesCurrentPage + 1;
      if (next >= topImages.length) next = 0;

      _pageController.animateToPage(
        next,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onTopImagesPageChanged() {
    if (!_pageController.hasClients || !mounted) return;
    final pos = _pageController.position;
    final page = (pos.pixels / pos.viewportDimension).round().clamp(0, topImages.length - 1);
    if (_topImagesCurrentPage != page) {
      setState(() => _topImagesCurrentPage = page);
    }
  }

  void _onManualSlidePageChanged() {
    if (!_manualSlideController.hasClients || !mounted) return;
    final pos = _manualSlideController.position;
    final page = (pos.pixels / pos.viewportDimension).round().clamp(0, manualSlideNames.length - 1);
    if (_manualSlideCurrentPage != page) {
      setState(() => _manualSlideCurrentPage = page);
    }
  }

  void _stopAutoSlide() {
    _userSwiped = true;
    _autoSlideTimer?.cancel();
  }

  @override
  void dispose() {
    _pageController.removeListener(_onTopImagesPageChanged);
    _manualSlideController.removeListener(_onManualSlidePageChanged);
    _pageController.dispose();
    _manualSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      bottomNavigationBar: _bottomNavBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              const SizedBox(height: 10),

              // PROFILE + CART
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile with onPressed (onTap)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      radius: 21,
                      backgroundImage: AssetImage(
                        "lib/client/profile/images/prof.png",
                      ),
                    ),
                  ),

                  // Shopping cart with onPressed (onTap)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartPage(),
                        ),
                      );
                    },
                    child: Container(
                      height: 43,
                      width: 43,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2F2F2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.shopping_cart,
                        color: Color(0xFFE3001B),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // SEARCH BAR
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
                    Transform.translate(
                      offset: const Offset(-5, 0),
                      child: const Icon(
                        Icons.search,
                        color: Color(0xFFAFAFAF),
                        size: 23,
                      ),
                    ),
                    const SizedBox(width: 3),

                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        cursorColor: Colors.black,
                        cursorHeight: 18,
                        onChanged: (value) {
                          setState(() => searchText = value);
                        },
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

              const SizedBox(height: 4),
                  ],
                ),
              ),

              // CONTENT
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics:
                      MediaQuery.of(context).orientation == Orientation.portrait
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  children: [
                    const SizedBox(height: 8),

                    // SLIDER (RESPONSIVE)
                    Transform.translate(
                      offset: const Offset(0, -3),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double width =
                              constraints.maxWidth; // full available width
                          double height = width * 0.42; // responsive height
                          if (height < 170) height = 160; // minimum height
                          if (height > 300)
                            height = 300; // max height for desktop

                          final int currentPage = _topImagesCurrentPage;

                          return GestureDetector(
                            onTap: () {
                              final flavorName = currentPage < topNames.length
                                  ? topNames[currentPage]
                                  : topNames.first;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MenuPage(initialFlavorName: flavorName),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    isMobile(context) ? 14 : 28,
                                  ),
                                  child: SizedBox(
                                    height: height,
                                    width: width,
                                    child:
                                        NotificationListener<
                                          ScrollNotification
                                        >(
                                          onNotification: (notification) {
                                            if (notification
                                                is ScrollStartNotification) {
                                              _stopAutoSlide();
                                            }
                                            return false;
                                          },
                                          child: PageView.builder(
                                            key: const PageStorageKey<String>('top_images_carousel'),
                                            controller: _pageController,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount: topImages.length,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 5),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(14),
                                                  child: Image.asset(
                                                    topImages[i],
                                                    width: width,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                  ),
                                ),
                                // Overlay on image: name left, star + 5.0 right
                                Positioned(
                                  bottom: 12,
                                  left: 15,
                                  right: 15,
                                  child: AnimatedBuilder(
                                    animation: _pageController,
                                    builder: (context, _) {
                                      final page = _topImagesCurrentPage;
                                      final name = page < topNames.length
                                          ? topNames[page]
                                          : topNames.first;
                                      final rating = page < topRatings.length
                                          ? topRatings[page]
                                          : topRatings.first;
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: isMobile(context)
                                                  ? 18
                                                  : 16,
                                              fontWeight: FontWeight.w600,
                                              shadows: [
                                                Shadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  offset: const Offset(0, 1),
                                                  blurRadius: 2,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: const Color(0xFFFFD700),
                                                size: isMobile(context)
                                                    ? 18
                                                    : 20,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                rating,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: isMobile(context)
                                                      ? 14
                                                      : 16,
                                                  fontWeight: FontWeight.w600,
                                                  shadows: [
                                                    Shadow(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      offset: const Offset(0, 1),
                                                      blurRadius: 2,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    const SizedBox(height: 4),
                    // Popular title
                    Transform.translate(
                      offset: const Offset(0, -6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF1C1B1F),
                            ),
                          ),
                        ],
                      ),
                    ),
                        ],
                      ),
                    ),

                    // Manual slideshow below Popular: name and star outside image (no padding 5)
                    const SizedBox(height: 0),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        double width = constraints.maxWidth;
                        double height = width * 0.42;
                        if (height < 170) height = 100;
                        if (height > 300) height = 270;
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            GestureDetector(
                              onTap: () {
                                final page = _manualSlideCurrentPage;
                                final name = page < manualSlideNames.length
                                    ? manualSlideNames[page]
                                    : manualSlideNames.first;
                                final itemIndex = page < manualSlideToMenuIndex.length
                                    ? manualSlideToMenuIndex[page]
                                    : 0;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MenuPage(
                                      initialItemIndex: itemIndex,
                                      initialDisplayName: name,
                                    ),
                                  ),
                                );
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  isMobile(context) ? 9 : 28,
                                ),
                                child: SizedBox(
                                  height: height,
                                  width: width,
                                  child: PageView.builder(
                                    key: const PageStorageKey<String>('manual_slide_carousel'),
                                    controller: _manualSlideController,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: manualSlideImages.length,
                                    itemBuilder: (context, i) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(9),
                                          child: Image.asset(
                                            manualSlideImages[i],
                                            width: width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                            const SizedBox(height: 4),
                            AnimatedBuilder(
                              animation: _manualSlideController,
                              builder: (context, _) {
                                final page = _manualSlideCurrentPage;
                                final name = page < manualSlideNames.length
                                    ? manualSlideNames[page]
                                    : manualSlideNames.first;
                                final price = page < manualSlidePrices.length
                                    ? manualSlidePrices[page]
                                    : manualSlidePrices.isNotEmpty
                                        ? manualSlidePrices.first
                                        : "₱1,700";
                                return GestureDetector(
                                  onTap: () {
                                    final p = _manualSlideCurrentPage;
                                    final slideName = p < manualSlideNames.length
                                        ? manualSlideNames[p]
                                        : manualSlideNames.first;
                                    final itemIdx = p < manualSlideToMenuIndex.length
                                        ? manualSlideToMenuIndex[p]
                                        : 0;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MenuPage(
                                          initialItemIndex: itemIdx,
                                          initialDisplayName: slideName,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                          Text(
                                            name,
                                            style: TextStyle(
                                              color: const Color(0xFF1C1B1F),
                                              fontSize: isMobile(context)
                                                  ? 17
                                                  : 16,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: const Color(0xFFFFD700),
                                                size: isMobile(context)
                                                    ? 18
                                                    : 20,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                "5.0",
                                                style: TextStyle(
                                                  color: const Color(0xFF1C1B1F),
                                                  fontSize: isMobile(context)
                                                      ? 14
                                                      : 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Transform.translate(
                                          offset: const Offset(0, -6),
                                          child: Text(
                                            price,
                                            style: const TextStyle(
                                              color: Color(0xFFE3001B),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    // FLAVORS (with padding 5)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                    const SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Flavors",
                          style: TextStyle(
                            color: Color(0xFF1C1B1F),
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MenuPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "See all",
                            style: TextStyle(
                              color: Color(0xFFE3001B),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    LayoutBuilder(
                        builder: (context, constraints) {
                          double width = constraints.maxWidth;

                          bool isMobile = width < 600;
                          int gridCount = width >= 1000
                              ? 4
                              : width >= 800
                              ? 3
                              : width >= 600
                              ? 2
                              : 1;

                          if (isMobile) {
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: filteredFlavors.isEmpty
                                    ? [
                                        const Text(
                                          "No result found",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ]
                                    : filteredFlavors.map((item) {
                                        final title = item["title"]!;
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8,
                                          ),
                                          child: _flavorCard(
                                            title,
                                            item["img"]!,
                                            width: 149,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MenuPage(
                                                    initialFlavorName: title,
                                                    initialDisplayName: title,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      }).toList(),
                              ),
                            );
                          }

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredFlavors.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: gridCount,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  childAspectRatio: 0.78,
                                ),
                            itemBuilder: (context, index) {
                              final item = filteredFlavors[index];
                              final title = item["title"]!;
                              return _flavorCard(
                                title,
                                item["img"]!,
                              
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(
                                        initialFlavorName: title,
                                        initialDisplayName: title,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _flavorCard(String title, String img,
      {double width = 142, VoidCallback? onTap}) {
    final card = Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Reduce the outer padding to minimize space at the corners of image
          Padding(
            padding: const EdgeInsets.all(6),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                img,
                height: width * 0.41,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 10, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1C1B1F),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "₱1,700",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                        color: Color(0xFFE3001B),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFD700), size: 15),
                        const SizedBox(width: 4),
                        const Text(
                          "5.0",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 11,
                            color: Color(0xFF1C1B1F),
                          ),
                        ),
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
    if (onTap != null) {
      return GestureDetector(onTap: onTap, child: card);
    }
    return card;
  }

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
              icon: Symbols.home,
              label: "Home",
              active: true,
              onTap: () {},
              fillColor: const Color(0xFFE3001B),
            ),
            _BottomIcon(
              icon: Symbols.local_mall,
              label: "Order",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OrderHistoryPage()),
                );
              },
            ),
            _BottomIcon(
              icon: Symbols.favorite,
              label: "Favorite",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FavoritePage()),
                );
              },
            ),
            _BottomIcon(
              icon: Symbols.chat,
              label: "Messages",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MessagesPage()),
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
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;
  final Color? fillColor;

  const _BottomIcon({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = active ? const Color(0xFFE3001B) : const Color(0xFF969696);
    final double fillValue = (active && fillColor != null) ? 1 : 0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 21,
              color: fillColor != null && active ? fillColor : iconColor,
              fill: fillValue,
              weight: 100,
              grade: 200,
              opticalSize: 24,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: iconColor,
                fontWeight: active ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
