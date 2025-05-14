import 'package:flutter/material.dart';
import 'more.dart';
import 'category.dart';
import 'promotions_notifications.dart';
import 'cart.dart';

class PersonalCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Product {
  final String name;
  final String image;
  final String price;
  final String? oldPrice;
  final String size;
  final double discount;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.oldPrice,
    required this.size,
    this.discount = 0,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Product> cart = [];

  final List<Product> products = [
    Product(name: "El Mazag White Sugar", image: "assets/sugar.png", price: "32.95 EGP", size: "1 KG"),
    Product(name: "Zaza Vegetable Ghee", image: "assets/ghee.png", price: "39.95 EGP", oldPrice: "45.75 EGP", size: "350 Gm", discount: 13),
    Product(name: "Zaza Mixed Oil", image: "assets/oil.png", price: "49.95 EGP", size: "700 ml"),
    Product(name: "Al Doha Egyptian Rice", image: "assets/rice1.png", price: "38.95 EGP", oldPrice: "44.50 EGP", size: "1 KG", discount: 12),
    Product(name: "N1 Tomato Paste", image: "assets/tomato.png", price: "—", size: ""),
    Product(name: "Ahl Algoma White Rice", image: "assets/rice2.png", price: "—", size: ""),
  ];

  final List<String> categories = [
    "All",
    "Sugar & Home Baking",
    "Cooking Ingredients",
    "Rice, Pasta & Pulses",
    "Tins, Jars & Packets",
    "Tea",
    "Kids Drinks",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery Shop'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: categories
              .map((cat) => ListTile(
                    title: Text(cat),
                    onTap: () => Navigator.pop(context),
                  ))
              .toList(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for products',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 280,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(product.image),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            ),
                          ),
                          if (product.discount > 0)
                            Positioned(
                              top: 5,
                              left: 5,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(5)),
                                child: Text('${product.discount.toInt()}% off', style: TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(product.size, style: TextStyle(fontSize: 12, color: Colors.grey)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Row(
                          children: [
                            Text(product.price, style: TextStyle(fontWeight: FontWeight.bold)),
                            if (product.oldPrice != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 6.0),
                                child: Text(
                                  product.oldPrice!,
                                  style: TextStyle(decoration: TextDecoration.lineThrough, fontSize: 12, color: Colors.grey),
                                ),
                              ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: Icon(Icons.add_circle, color: Colors.blue),
                          onPressed: () {
                            setState(() {
                              cart.add(product);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${product.name} added to cart')),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
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
