import 'package:flutter/material.dart';
import 'promotions_notifications.dart';
import 'cart.dart';
import 'more.dart';
import 'hot_prices.dart';

class CategoryPage extends StatelessWidget {
  final String categoryName;

  const CategoryPage({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/logo.png',
                  height: 80,
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
              ],
            ),
            Icon(Icons.qr_code, color: Colors.black),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delivery Banner
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
              // Promo Banner
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

              // Sections
              _buildCategorySection(context, "Fresh Food", [
                _categoryCard("Chilled Food", "assets/chilledfood.jpeg"),
                _categoryCard("Dairy & Eggs", "assets/dairy.jpeg"),
                _categoryCard("Fish & Seafood", "assets/fish.jpeg"),
                _categoryCard("Meat & Poultry", "assets/meat.jpg"),
              ]),
              _buildCategorySection(context, "Fruits & Vegetables", [
                _categoryCard("Fruits", "assets/fruit.jpeg"),
                _categoryCard("Vegetables", "assets/vegetables.jpeg"),
                _categoryCard("Herbs", "assets/herbs.png"),
              ]),
              _buildCategorySection(context, "Food Cupboard", [
                _categoryCard("Biscuits", "assets/biscuit.jpeg"),
                _categoryCard("Jars & Packets", "assets/tins.jpeg"),
                _categoryCard("Breakfast Bars", "assets/cereals.jpeg"),
                _categoryCard("Chips & Snacks", "assets/chips.jpeg"),
              ]),
              _buildCategorySection(context, "Beverages", [
                _categoryCard("Water", "assets/water.jpeg"),
                _categoryCard("Coffee", "assets/coffee.jpeg"),
                _categoryCard("Tea", "assets/tea.jpeg"),
                _categoryCard("Soft Drinks", "assets/bevarages.jpeg"),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          } else if (index == 2) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DealsPage()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          } else if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()));
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Text("View All", style: TextStyle(color: Colors.blue)),
          ],
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: items,
        ),
      ],
    );
  }

  Widget _categoryCard(String label, String imagePath) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
