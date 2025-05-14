import 'dart:async';
import 'package:carrefour/baby_products.dart';
import 'package:carrefour/best_sellers.dart';
import 'package:carrefour/beverage.dart';
import 'package:carrefour/bulk_savings.dart';
import 'package:carrefour/chocolate.dart';
import 'package:carrefour/cleaning.dart';
import 'package:carrefour/cold_cuts.dart';
import 'package:carrefour/frozen.dart';
import 'package:carrefour/fruits.dart';
import 'package:carrefour/grocery.dart';
import 'package:carrefour/hot_prices.dart';
import 'package:carrefour/laundry.dart';
import 'package:carrefour/meat.dart';
import 'package:carrefour/personal_care.dart';
import 'package:carrefour/smashing_prices.dart';
import 'package:flutter/material.dart';
import 'more.dart';
import 'category.dart';
import 'promotions_notifications.dart';
import 'cart.dart'; 


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
                Image.asset(
                  'assets/logo.png',
                  height: 80,
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
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
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          DeliveryInfoCard(),
          SizedBox(height: 10),
          PromoCard(),
          SizedBox(height: 10),
          AutoScrollingBanner(),
          SizedBox(height: 20),
          CategoryGrid(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 1) {
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
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Deals'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

class AutoScrollingBanner extends StatefulWidget {
  @override
  _AutoScrollingBannerState createState() => _AutoScrollingBannerState();
}

class _AutoScrollingBannerState extends State<AutoScrollingBanner> {
  final ScrollController _scrollController = ScrollController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double currentPosition = _scrollController.offset;

        double nextPosition = currentPosition + MediaQuery.of(context).size.width;

        if (nextPosition >= maxScrollExtent) {
          nextPosition = 0;
        }

        _scrollController.animateTo(
          nextPosition,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        children: [
          BannerCard(imagePath: 'assets/smashingprices2.jpeg'),
          BannerCard(imagePath: 'assets/exclusiveonline.jpeg'),
          BannerCard(imagePath: 'assets/smashingprices3.jpeg'),
          BannerCard(imagePath: 'assets/essentialbudgets.jpeg'),
          BannerCard(imagePath: 'assets/bulksave.jpeg'),
          BannerCard(imagePath: 'assets/freedelivary.jpeg'),
        ],
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'label': 'Smashing Prices', 'image': 'assets/smashinprices.jpeg'},
    {'label': 'Hot Prices', 'image': 'assets/bestprices.jpeg'},
    {'label': 'Best Sellers', 'image': 'assets/bestsellers.jpeg'},
    {'label': 'Bulk Savings', 'image': 'assets/bulkdeals.jpeg'},
    {'label': 'Coupons Zone', 'image': 'assets/coupons.jpg'},
    {'label': 'Chocolate & Snacks', 'image': 'assets/chocolates.jpeg'},
    {'label': 'Grocery Essentials', 'image': 'assets/grocery.jpeg'},
    {'label': 'Meat & Poultry', 'image': 'assets/meat.jpeg'},
    {'label': 'Laundry & Detergents', 'image': 'assets/laundry.jpg'},
    {'label': 'Cleaning Essentials', 'image': 'assets/cleaning.jpeg'},
    {'label': 'Frozen Food', 'image': 'assets/frozenfood.jpeg'},
    {'label': 'Beverage', 'image': 'assets/bevarages.jpeg'},
    {'label': 'Cold Cuts', 'image': 'assets/coldcuts.jpeg'},
    {'label': 'Fruits & Vegetables', 'image': 'assets/fruit.jpeg'},
    {'label': 'Personal Care', 'image': 'assets/personalcare.jpeg'},
    {'label': 'Baby Products', 'image': 'assets/baby.jpg'},
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
        return GestureDetector(
          onTap: () {
            if (category['label'] == 'Smashing Prices') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SmashingPricesPage()),
              );
            }else if (category['label'] == 'Hot Prices') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HotPricesPage()),
              );
            } else if (category['label'] == 'Best Sellers') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BestSellersPage()),
              );
            } else if (category['label'] == 'Bulk Savings') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BulkSavingsPage()),
              );
            } else if (category['label'] == 'Chocolate & Snacks') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChocolatePage()),
              );
            } else if (category['label'] == 'Grocery Essentials') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroceryPage()),
              );
            } else if (category['label'] == 'Meat & Poultry') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MeatPage()),
              );
            } else if (category['label'] == 'Laundry & Detergents') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LaundryPage()),
              );
            } else if (category['label'] == 'Cleaning Essentials') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CleaningPage()),
              );
            } else if (category['label'] == 'Frozen Food') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FrozenPage()),
              );
            } else if (category['label'] == 'Beverage') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beverage()),
              );
            } else if (category['label'] == 'Cold Cuts') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ColdCutsPage()),
              );
            } else if (category['label'] == 'Fruits & Vegetables') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FruitsPage()),
              );
            } else if (category['label'] == 'Personal Care') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PersonalCarePage()),
              );
            } else if (category['label'] == 'Baby Products') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BabyProductsPage()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CategoryPage(categoryName: category['label']!),
                ),
              );
            }
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(category['image']!),
              ),
              SizedBox(height: 5),
              Text(
                category['label']!,
                style: TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      },
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
  final String imagePath;

  BannerCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class CategoryPage extends StatelessWidget {
  final String categoryName;

  CategoryPage({required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: Center(
        child: Text(
          'Welcome to $categoryName category!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
