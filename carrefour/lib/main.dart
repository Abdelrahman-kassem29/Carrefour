import 'dart:async';
import 'package:flutter/material.dart';


import 'baby_products.dart';
import 'best_sellers.dart';
import 'beverage.dart';
import 'bulk_savings.dart';
import 'chocolate.dart';
import 'cleaning.dart';
import 'cold_cuts.dart';
import 'frozen.dart';
import 'fruits.dart';
import 'grocery.dart';
import 'hot_prices.dart';
import 'laundry.dart';
import 'meat.dart';
import 'personal_care.dart';
import 'smashing_prices.dart';
import 'more.dart';
import 'category.dart';
import 'promotions_notifications.dart';
import 'cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrefour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(categoryName: "All Categories"),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DealsPage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MorePage()),
              );
              break;
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

// ... (Keep all other classes such as AutoScrollingBanner, CategoryGrid, DeliveryInfoCard, PromoCard, BannerCard, CategoryPage as you have them)

