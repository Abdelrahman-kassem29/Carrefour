import 'package:carrefour/checkout.dart';
import 'package:flutter/material.dart';
import 'more.dart';
import 'category.dart';
import 'promotions_notifications.dart';
// Simple Product model
class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Sample cart items (in a real app, you'll get this from state management or backend)
  List<Product> cartItems = [
    Product(
      id: '1',
      name: 'Apple',
      price: 3.5,
      imageUrl: 'assets/fruit.jpeg',
    ),
    Product(
      id: '2',
      name: 'Chocolate Bar',
      price: 5.0,
      imageUrl: 'assets/chocolates.jpeg',
    ),
  ];

  void _removeFromCart(String productId) {
    setState(() {
      cartItems.removeWhere((item) => item.id == productId);
    });
  }

  double get totalPrice =>
      cartItems.fold(0, (sum, item) => sum + item.price);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartItems.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartItems[index];
                      return ListTile(
                        leading: Image.asset(
                          product.imageUrl,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(product.name),
                        subtitle: Text('${product.price.toStringAsFixed(2)} EGP'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _removeFromCart(product.id),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${totalPrice.toStringAsFixed(2)} EGP',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CheckoutPage()),
                    );
                  },
                  child: Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3, // Set the current index for the cart page
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst); // Home Page
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(categoryName: "All Categories"),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DealsPage()),
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MorePage()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Deals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
