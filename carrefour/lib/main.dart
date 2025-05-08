import 'package:flutter/material.dart';
import 'more.dart'; // Import your MorePage class here

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                DeliveryOptionButton(label: 'Scheduled Delivery'),
                SizedBox(width: 10),
                DeliveryOptionButton(label: 'NOW Delivery', isSelected: false),
              ],
            ),
            Icon(Icons.qr_code, color: Colors.black),
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          DeliveryInfoCard(),
          SizedBox(height: 10),
          PromoCard(),
          SizedBox(height: 10),
          BannerCard(),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoButton(label: 'Join MyClub', icon: Icons.person),
              InfoButton(label: 'Carrefour Leaflet', icon: Icons.book),
              InfoButton(label: 'Scan', icon: Icons.qr_code_scanner),
            ],
          ),
          SizedBox(height: 20),
          CategoryGrid(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MorePage()), // Navigate to MorePage
            );
          }
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

class DeliveryOptionButton extends StatelessWidget {
  final String label;
  final bool isSelected;

  DeliveryOptionButton({required this.label, this.isSelected = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}

class DeliveryInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.local_shipping, size: 30),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            'Delivery Tomorrow 10 AM. 30,000+ products to choose from',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class PromoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(Icons.card_giftcard, size: 30, color: Colors.blue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              'First Order? Use code HELLO15 to get 15% OFF - Up to 120 EGP',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/banner_placeholder.png'), // Replace with your asset
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class InfoButton extends StatelessWidget {
  final String label;
  final IconData icon;

  InfoButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40, color: Colors.blue),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'label': 'Smashing Prices', 'image': 'assets/smashing_prices.png'},
    {'label': 'Hot Prices', 'image': 'assets/hot_prices.png'},
    {'label': 'Best Sellers', 'image': 'assets/best_sellers.png'},
    {'label': 'Grocery Essentials', 'image': 'assets/grocery_essentials.png'},
    {'label': 'TVs', 'image': 'assets/tvs.png'},
    {'label': 'Large Appliances', 'image': 'assets/large_appliances.png'},
    {'label': 'Meat & Poultry', 'image': 'assets/meat_poultry.png'},
    {'label': 'Cold Cuts', 'image': 'assets/cold_cuts.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(category['image']!), // Replace with your asset
            ),
            SizedBox(height: 5),
            Text(
              category['label']!,
              style: TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
