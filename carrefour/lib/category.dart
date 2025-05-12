import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.schedule, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  "Scheduled Delivery",
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.delivery_dining, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  "NOW Delivery",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      "Search for products",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Spacer(),
                    Icon(Icons.qr_code_scanner, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Delivery Details
              Row(
                children: [
                  Icon(Icons.local_shipping, color: Colors.black),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Delivery Tomorrow 10 AM. 30,000+ products to choose from",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
                ],
              ),
              SizedBox(height: 16),
              // Offer Banner
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.card_giftcard, color: Colors.orange, size: 30),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "First Order? Use code HELLO15 to get 15% OFF - Up to 120 EGP",
                        style: TextStyle(color: Colors.blue, fontSize: 14),
                      ),
                    ),
                    Icon(Icons.copy, color: Colors.blue),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Featured Banner
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/banner.jpg'), // Replace with your asset path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Category Icons
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  _categoryButton("Smashing Prices", Icons.local_offer),
                  _categoryButton("Hot Prices", Icons.fireplace),
                  _categoryButton("Best Selling", Icons.star),
                  _categoryButton("Grocery Essentials", Icons.shopping_basket),
                  _categoryButton("TVs", Icons.tv),
                  _categoryButton("Large Appliances", Icons.kitchen),
                  _categoryButton("Meat & Poultry", Icons.restaurant),
                  _categoryButton("Cold Cuts", Icons.fastfood),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Deals",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.red,
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(String title, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Colors.grey.shade200,
          child: Icon(icon, color: Colors.black),
        ),
        SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
