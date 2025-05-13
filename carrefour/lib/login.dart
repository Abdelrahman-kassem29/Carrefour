import 'package:flutter/material.dart';
import 'signup.dart'; // Ensure this is the correct import

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/logoWide.png',
          height: 80, // Adjust height to fit within the app bar
        ),
        centerTitle: true, // Center the logo in the app bar
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Global padding for the screen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20), // Add spacing after app bar
                      // Text(
                      //   'Login',
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //     fontWeight: FontWeight.bold,
                      //     color: Color(0xFF005BAC),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      Text(
                        'Get access to over 190,000\nquality products',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Input padding
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16), // Spacing between input and button
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF005BAC),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Divider(indent: 10, endIndent: 10)),
                          Text('or'),
                          Expanded(child: Divider(indent: 10, endIndent: 10)),
                        ],
                      ),
                      SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _socialButton('assets/facebook.png'),
                            _socialButton('assets/google.png'),
                            _socialButton('assets/apple.png'),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Text('New to Carrefour?'),
                      SizedBox(height: 8),
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
                      // Fill the bottom space with the image
                      Container(
                        width: double.infinity, // Fill the width
                        height: MediaQuery.of(context).size.height * 0.3, // Set the height to cover 30% of the screen height
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/loginpage.png'),
                            fit: BoxFit.cover, // Ensure it covers the space without distortion
                          ),
                        ),
                      ),
                      SizedBox(height: 30), // Add space below the image if needed
                    ],
                  ),
                ),
              ],
            ),
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
