import 'package:flutter/material.dart';
import 'more.dart';
import 'category.dart';
import 'promotions_notifications.dart';
import 'main.dart';
import 'cart.dart';

class RicePage extends StatefulWidget {
  @override
  _RicePageState createState() => _RicePageState();
}

class _RicePageState extends State<RicePage> {
  bool isTunaChecked = true;
  bool isTomatoPasteChecked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for products',
            border: InputBorder.none,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80), // Leave space for fixed bar
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product info
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(
                            'assets/rice.jpg',
                            height: 200,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Al Doha Egyptian Rice - 1kg',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text('38.95', style: TextStyle(fontSize: 20, color: Colors.green)),
                        Text(
                          '44.50',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text('Including VAT', style: TextStyle(fontSize: 14, color: Colors.grey)),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Sold & Shipped'),
                                Text('Carrefour', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Column(
                              children: [
                                Text('Origin'),
                                Row(
                                  children: [
                                    Icon(Icons.flag, color: Colors.red, size: 18),
                                    SizedBox(width: 4),
                                    Text('Egypt', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(),

                  // Expandable sections
                  ExpansionTile(
                   title: Text('Description'),
                   children: [
                    Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                                '''100% premium and first class Egyptian white rice
                                Rice grains carefully selected for their fine texture and lovely aroma
                                Used in many dishes in cooking and filling
                                Ideal for rice preparations, sweet porridges, and delicious tomato-rice soup'''
                         ),
                   )
                  ],
                  ),
                  ExpansionTile(title: Text('Nutrition Facts'), children: [Padding(padding: EdgeInsets.all(8), child: Text('A 100g serving of boiled white rice provides approximately 131 calories, 2.8g of protein, 0.4g of fat, 31.1g of carbohydrates, and 0.5g of fiber'))]),
                  ExpansionTile(title: Text('Information'), children: [Padding(padding: EdgeInsets.all(8), child: Text('Additional product information about rice.'))]),

                  // Frequently Bought Together
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Frequently bought together', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Checkbox(
                              value: isTunaChecked,
                              onChanged: (value) {
                                setState(() {
                                  isTunaChecked = value!;
                                });
                              },
                            ),
                            Image.asset('assets/tuna.jpeg', height: 60),
                            SizedBox(width: 8),
                            Text('N1 Shredded Tuna\nEGP 27.95'),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: isTomatoPasteChecked,
                              onChanged: (value) {
                                setState(() {
                                  isTomatoPasteChecked = value!;
                                });
                              },
                            ),
                            Image.asset('assets/chips.jpeg', height: 60),
                            SizedBox(width: 8),
                            Text('Lays Chips with Cheese - 65 gram\nEGP 10.00'),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('Add to cart (EGP 45.90)'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            textStyle: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),

                  // Picks of the Week with + button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Picks of the week', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            final picks = [
                              {'image': 'assets/tea.jpeg', 'name': 'Tea', 'price': 'EGP 27.95'},
                              {'image': 'assets/coffee.jpeg', 'name': 'Coffee', 'price': 'EGP 35.00'},
                              {'image': 'assets/biscuit.jpeg', 'name': 'Biscuit', 'price': 'EGP 20.50'},
                              {'image': 'assets/cereals.jpeg', 'name': 'Cereals', 'price': 'EGP 15.75'},
                            ];
                            final pick = picks[index];

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(pick['image']!, height: 100),
                                    Positioned(
                                      right: 20,
                                      bottom: 0,
                                      child: GestureDetector(
                                        onTap: () {
                                          // Show snackbar confirming add to cart
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('${pick['name']} added to cart!')),
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 36, 18, 198),
                                            shape: BoxShape.circle,
                                          ),
                                          padding: EdgeInsets.all(6),
                                          child: Icon(Icons.add, color: Colors.white, size: 15),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Text(pick['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                                Text(pick['price']!),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Fixed Add to Cart Row
          Positioned(
            bottom: 0, // Above bottom navigation
            left: 0,
            right: 0,
            child: Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.delivery_dining, size: 24),
                      SizedBox(width: 6),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("NOW", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.amber[700],
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("60 mins", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800],
                      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text("Add to cart", style: TextStyle(fontSize: 16, color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          else if (index == 1) Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(categoryName: "All Categories")));
          else if (index == 2) Navigator.push(context, MaterialPageRoute(builder: (context) => DealsPage()));
          else if (index == 3) Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          else if (index == 4) Navigator.push(context, MaterialPageRoute(builder: (context) => MorePage()));
        },
        items: const [
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
