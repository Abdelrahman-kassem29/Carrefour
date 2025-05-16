import 'package:flutter/material.dart';
import 'package:your_project_name/services/auth_service.dart'; // adjust import path
import 'signup.dart'; // Your signup page

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _authService = AuthService();

  String _message = '';

  void _login() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      setState(() {
        _message = 'Please enter your email';
      });
      return;
    }

    // For demo, just use a fixed dummy password or add a password field similarly
    // Replace with your password field later
    const dummyPassword = '123456';

    var user = await _authService.signIn(email, dummyPassword);

    setState(() {
      if (user != null) {
        _message = 'Welcome, ${user.email}';
      } else {
        _message = 'Login failed. Check your email/password.';
      }
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          'assets/logoWide.png',
          height: 80,
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SizedBox(height: 10),
                      Text(
                        'Get access to over 190,000\nquality products',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: _login,
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
                      SizedBox(height: 8),
                      Text(
                        _message,
                        style: TextStyle(
                          color: _message.contains('Welcome') ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
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
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/loginpage.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
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
