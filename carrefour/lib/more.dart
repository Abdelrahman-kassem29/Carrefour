import 'package:flutter/material.dart';
import 'login.dart'; 
import 'main.dart'; 
import 'promotions_notifications.dart'; 
import 'cart.dart'; 

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('More')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for products',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Leaflets
              Text(
                'Leaflets (2)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Image.asset('assets/leaf1.1.jpeg'),
                      SizedBox(width: 16), // Add space between the two images
                      Image.asset('assets/leaf2.1.jpeg'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),

              // Login/Register Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF005BAC),
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text(
                  'Login or Register',
                  style: TextStyle(color: Colors.white), // Set text color to white
                ),
              ),
              SizedBox(height: 24),

              // Explore In-store experience
              Text(
                'Explore instore experience',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 12),

              _buildListItem(Icons.qr_code_scanner, 'Scan & Go'),
              _buildListItem(Icons.live_tv, 'Live Shopping'),
              _buildListItem(Icons.language, 'Country', trailing: Text('Egypt (English)')),
              _buildListItem(Icons.shopping_bag_outlined, 'Buy Again'),
              _buildListItem(Icons.favorite_border, 'Wishlist'),
              _buildListItem(Icons.support_agent, 'Customer Service'),
              _buildListItem(Icons.info_outline, 'About Us'),
              _buildListItem(Icons.article_outlined, 'Terms & Conditions'),
              _buildListItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(), 
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DealsPage(),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(), 
              ),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MorePage()),
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

  Widget _buildListItem(IconData icon, String title, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(title),
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Add navigation or action here
      },
    );
  }
}
