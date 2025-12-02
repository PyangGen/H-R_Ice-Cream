import 'package:flutter/material.dart';

class DeliveryTrackerPage extends StatelessWidget {
  const DeliveryTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map placeholder
          Container(
            height: double.infinity,
            color: Colors.grey.shade300,
            child: const Center(
              child: Text(
                'Map View Placeholder',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          // Bottom sheet panel
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height:
                  MediaQuery.of(context).size.height * 0.58, // adjust height
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20, // horizontal padding
                      vertical: 16, // keeps vertical spacing
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Your content here (same as your current Column)
                        Row(
                          children: const [
                            Text(
                              'Estimated Arrival:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '30 mins',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'lib/client/order/images/box.png',
                                  width: 45,
                                  height: 45,
                                ),
                                const SizedBox(width: 12),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      '#32456124',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      'Ice Cream',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF676767),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF7051C7),
                                minimumSize: const Size(
                                  93,
                                  30,
                                ), // <-- width, height
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Driving',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const Divider(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // LEFT - Shipped By
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Shipped By:',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF1C1B1F),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  'Quinjay',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            // CENTER - Order Cost
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 8,
                                  ), // moves only "Created:" left
                                  child: Text(
                                    'Order Cost',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF1C1B1F),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '\$300.00',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(
                                    right: 28,
                                  ), // moves only "Created:" left
                                  child: Text(
                                    'Created:',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF1C1B1F),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '10/14/2025',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),

                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Quantity:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF606060),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '3',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Size:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF606060),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Mixed',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Order:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF606060),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Strawberry',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Order cost:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF606060),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '₱300.00',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Payment Method:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF606060),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Gcash',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 160,
                                    child: Text(
                                      'Status:',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF606060),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Paid',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Message Driver button
                            Expanded(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 55, // same as Check Out
                                  decoration: BoxDecoration(
                                    color: Colors.white, // white background
                                    borderRadius: BorderRadius.circular(
                                      35,
                                    ), // rounded corners
                                    border: Border.all(
                                      color: Color(0xFF8B8B8B),
                                    ), // border color
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Message Driver",
                                      style: TextStyle(
                                        color: Color(0xFF494949), // text color
                                        fontSize: 16, // same size as Check Out
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 13),

                            // Call icon button
                            Container(
                              height: 55, // same height as button
                              width:
                                  55, // slightly bigger circle like Check Out add icon
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                border: Border.all(color: Color(0xFF8B8B8B)),
                              ),
                              child: const Icon(
                                Icons.call, // updated icon
                                color: Color(0xFF494949),
                                size: 28, // same as add icon
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
