import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circular image at the top center
            CircleAvatar(
              radius: 60, // Size of the circle
              backgroundImage: AssetImage('assets/your_image.png'), // Replace with your image path
            ),
            SizedBox(height: 20),

            // Statement text below the image, now in blue
            Text(
              'Looking for something?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue, // Blue color for the statement
              ),
            ),
            SizedBox(height: 20),

            // Bigger button with white background to navigate to Home
            ElevatedButton(
              onPressed: () {
                // Navigate back to the Home screen
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // White background
                foregroundColor: Colors.blue, // Blue text color
                minimumSize: Size(250, 70), // Even bigger button size
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(color: Colors.blue, width: 2), // Blue border
              ),
              child: Text(
                'Go to Home',
                style: TextStyle(
                  fontSize: 20, // Larger text size
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
