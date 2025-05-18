import 'package:flutter/material.dart';
import 'more.dart';
import 'category.dart';
import 'cart.dart'; 
import 'main.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({Key? key}) : super(key: key);

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
          Image.asset(
            'assets/logo.png',
            height: 60,
          ),
          SizedBox(width: 10),
          Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            sectionTitle("Carrefour Offers"),
            offerCircles(),
            const SizedBox(height: 16),
            sectionTitle("Carrefour Top Offers"),
            topOffersList(),
            const SizedBox(height: 16),
            sectionTitle("Food Cupboard Essentials!"),
            essentialsBanners(),
            const SizedBox(height: 16),
            sectionTitle("Top Selling Grocery!"),
            topSellingList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(), 
              ),
            );
          }else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryName: "All Categories"),
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

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget offerCircles() {
    final List<Map<String, String>> offers = [
      {'image': 'assets/smashinprices.jpeg', 'text': 'Smashing\nPrices'},
      {'image': 'assets/bestprices.jpeg', 'text': 'Hot\nPrices!'},
      {'image': 'assets/bestsellers.jpeg', 'text': 'Best\nSellers!'},
      {'image': 'assets/onlineleaflet.jpeg', 'text': 'Online\nLeaflet'},
      {'image': 'assets/budgetstore.jpeg', 'text': 'Budget\nStore'},
      {'image': 'assets/newarrivals.jpeg', 'text': 'New\nArrivals'},
      {'image': 'assets/carrefourproduct.jpeg', 'text': 'Carrefour\nProducts'},
      {'image': 'assets/bulkdeals.jpeg', 'text': 'Bulk\nSaving'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: offers.length,
        itemBuilder: (context, index) {
          final offer = offers[index];
          return Column(
            children: [
              ClipOval(
                child: Image.asset(
                  offer['image']!,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                offer['text']!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget topOffersList() {
    final List<Map<String, dynamic>> topOffers = [
      {'name': 'Ariel Automatic Powder Detergent - Lavender Scent - 4.5 kg', 'price': 339.95, 'oldPrice': 404.00, 'discount': '16%', 'image': 'assets/ariel.webp'},
      {'name': 'Halwani Beef Burger - 1 kg - 20 Pieaces', 'price': 183.95, 'oldPrice': 281.00, 'discount': '35%', 'image': 'assets/burger.jpeg'},
      {'name': 'Al Doha Egyptian Rice - 1kg', 'price': 38.95, 'oldPrice': 44.50, 'discount': '12%', 'image': 'assets/rice.jpg'},
    ];

    return SizedBox(
      height: 320,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: topOffers.length,
        itemBuilder: (context, index) {
          final offer = topOffers[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    offer['image'],
                    width: double.infinity,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    offer['discount'],
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const Spacer(),
                Text(
                  offer['name'],
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text("${offer['price']} EGP", style: const TextStyle(fontSize: 13)),
                Text(
                  "${offer['oldPrice']} EGP",
                  style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 11),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget essentialsBanners() {
    final List<Map<String, String>> banners = [
      {'image': 'assets/fce1.jpg'},
      {'image': 'assets/fce2.jpg'},
      {'image': 'assets/fce3.jpg'},
      {'image': 'assets/fce4.jpg'},
      {'image': 'assets/fce5.jpg'},
      {'image': 'assets/fce6.jpg'},
      {'image': 'assets/fce7.jpg'},
      {'image': 'assets/fce8.jpg'},
      {'image': 'assets/fce9.jpg'},
      {'image': 'assets/fce10.jpg'},
      {'image': 'assets/fce11.jpg'},
    ];

    return Padding(
      padding: const EdgeInsets.all(12), // Uniform padding for the entire widget
      child: SizedBox(
        height: 500,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: banners.length,
          separatorBuilder: (_, __) => const SizedBox(width: 12), // Consistent spacing between items
          itemBuilder: (context, index) {
            final banner = banners[index];

            return Container(
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Image.asset(
                  banner['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topSellingList() {
    final List<Map<String, dynamic>> products = [
      {'name': 'Kata Kito', 'price': 5.00, 'oldPrice': 5.80, 'discount': '14%', 'image': 'assets/katakito.jpeg'},
      {'name': 'Dolphin Tuna', 'price': 25.00, 'oldPrice': 29.00, 'discount': '14%', 'image': 'assets/tuna.jpeg'},
      {'name': 'Water Bottle', 'price': 6.95, 'oldPrice': 8.40, 'discount': '17%', 'image': 'assets/water.jpg'},
    ];

    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            width: 140,
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    product['image'],
                    width: double.infinity,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    product['discount'],
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const Spacer(),
                Text(
                  product['name'],
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text("${product['price']} EGP", style: const TextStyle(fontSize: 13)),
                Text(
                  "${product['oldPrice']} EGP",
                  style: const TextStyle(decoration: TextDecoration.lineThrough, fontSize: 11),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
