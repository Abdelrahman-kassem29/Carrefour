import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _apartmentController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _visaNumberController = TextEditingController();
  final TextEditingController _visaExpiryController = TextEditingController();
  final TextEditingController _visaCvvController = TextEditingController();

  String _paymentMethod = 'Cash on Delivery';

  @override
  void dispose() {
    _buildingController.dispose();
    _apartmentController.dispose();
    _floorController.dispose();
    _streetController.dispose();
    _phoneController.dispose();
    _visaNumberController.dispose();
    _visaExpiryController.dispose();
    _visaCvvController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Order placed successfully!')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white, // box background color
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Building Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _buildingController,
                  decoration: InputDecoration(hintText: 'Enter building name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter building name';
                    return null;
                  },
                ),
                SizedBox(height: 16),

                Text('Apartment Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _apartmentController,
                  decoration: InputDecoration(hintText: 'Enter apartment number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter apartment number';
                    return null;
                  },
                ),
                SizedBox(height: 16),

                Text('Floor Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _floorController,
                  decoration: InputDecoration(hintText: 'Enter floor number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter floor number';
                    return null;
                  },
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16),

                Text('Street', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _streetController,
                  decoration: InputDecoration(hintText: 'Enter street name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter street name';
                    return null;
                  },
                ),
                SizedBox(height: 16),

                Text('Phone Number', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(hintText: 'Enter your phone number'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your phone number';
                    if (!RegExp(r'^\+?[0-9]{7,15}$').hasMatch(value)) return 'Please enter a valid phone number';
                    return null;
                  },
                ),
                SizedBox(height: 24),

                Text('Payment Method', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                ListTile(
                  title: const Text('Cash on Delivery'),
                  leading: Radio<String>(
                    value: 'Cash on Delivery',
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Visa'),
                  leading: Radio<String>(
                    value: 'Visa',
                    groupValue: _paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        _paymentMethod = value!;
                      });
                    },
                  ),
                ),

                if (_paymentMethod == 'Visa') ...[
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _visaNumberController,
                    decoration: InputDecoration(
                      labelText: 'Visa Card Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (_paymentMethod == 'Visa') {
                        if (value == null || value.isEmpty) return 'Please enter your Visa card number';
                        if (!RegExp(r'^\d{16}$').hasMatch(value.replaceAll(' ', ''))) return 'Enter a valid 16-digit card number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _visaExpiryController,
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      hintText: 'MM/YY',
                    ),
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (_paymentMethod == 'Visa') {
                        if (value == null || value.isEmpty) return 'Please enter expiry date';
                        if (!RegExp(r'^(0[1-9]|1[0-2])\/?([0-9]{2})$').hasMatch(value)) return 'Enter expiry date in MM/YY format';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12),
                  TextFormField(
                    controller: _visaCvvController,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: '3 digits',
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (value) {
                      if (_paymentMethod == 'Visa') {
                        if (value == null || value.isEmpty) return 'Please enter CVV';
                        if (!RegExp(r'^\d{3}$').hasMatch(value)) return 'Enter a valid 3-digit CVV';
                      }
                      return null;
                    },
                  ),
                ],

                SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text('Confirm Order'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
