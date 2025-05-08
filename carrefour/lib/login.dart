import 'package:flutter/material.dart';
import 'signup.dart'; // Ensure this is the correct import

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView( // Fix: make it scrollable and interactive
          child: Column(
            children: [
              SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.pop(context),
                alignment: Alignment.topLeft,
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/carrefour_logo.png',
                height: 60,
              ),
              SizedBox(height: 20),
              Text(
                'Get access to over 190,000\nquality products',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Email address',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF005BAC),
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: Divider(indent: 20, endIndent: 10)),
                  Text('or'),
                  Expanded(child: Divider(indent: 10, endIndent: 20)),
                ],
              ),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _socialButton('assets/facebook.png'),
                    _socialButton('assets/google.png'),
                    _socialButton('assets/apple.png'),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text('New to Carrefour?'),
              GestureDetector(
                onTap: () {
                  print('Navigating to signup...');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                },
                child: Text(
                  'Sign up for a new account',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(String assetPath) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(assetPath, height: 24, width: 24),
    );
  }
}
