import 'package:flutter/material.dart';

class DealsPage extends StatelessWidget {
  const DealsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Carrefour Deals")),
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
      {'text': 'Smashing\nPrices'},
      {'text': 'Hot\nPrices!'},
      {'text': 'Best\nSellers!'},
      {'text': 'Online\nLeaflet'},
      {'text': 'Budget\nStore'},
      {'text': 'New\nArrivals'},
      {'text': 'Carrefour\nProducts'},
      {'text': 'Bulk\nSaving'},
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: offers.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.red,
                child: Text(
                  offers[index]['text']!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget topOffersList() {
    final List<Map<String, dynamic>> topOffers = [
      {'name': 'Ariel Detergent', 'price': 339.95, 'oldPrice': 404.00, 'discount': '16%'},
      {'name': 'Great Cup Burgers', 'price': 119.95, 'oldPrice': 178.00, 'discount': '33%'},
      {'name': 'Rice Bag', 'price': 38.95, 'oldPrice': 44.50, 'discount': '12%'},
    ];

    return SizedBox(
      height: 180,
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
      {'text': 'UP TO 35% OFF\nFood Essentials Zone', 'color': 'red'},
      {'text': 'Dairy Products\nUp to 25% OFF', 'color': 'blue'},
      {'text': 'Snacks Zone\nSave Big', 'color': 'green'},
    ];

    return SizedBox(
      height: 150,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: banners.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final banner = banners[index];
          final color = banner['color'] == 'red'
              ? Colors.red
              : banner['color'] == 'blue'
                  ? Colors.blue[400]
                  : Colors.green[400];
          return Container(
            width: 250,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                banner['text']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget topSellingList() {
    final List<Map<String, dynamic>> products = [
      {'name': 'Kata Choco Bar', 'price': 5.00, 'oldPrice': 5.80, 'discount': '14%'},
      {'name': 'Dolphin Tuna', 'price': 25.00, 'oldPrice': 29.00, 'discount': '14%'},
      {'name': 'Water Bottle', 'price': 6.95, 'oldPrice': 8.40, 'discount': '17%'},
    ];

    return SizedBox(
      height: 180,
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
