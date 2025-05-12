import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? selectedTitle;
  final _formKey = GlobalKey<FormState>();
  bool agreeToTerms = false;
  bool obscurePassword = true;

  final List<String> titles = ['Mr', 'Mrs', 'Miss / Ms'];
  final List<String> nationalities = ['Afghan', 'Albanian', 'Algerian', 'American', 'Andorran', 'Angolan',
    'Argentine', 'Armenian', 'Australian', 'Austrian', 'Azerbaijani',
    'Bahraini', 'Bangladeshi', 'Barbadian', 'Belarusian', 'Belgian',
    'Belizean', 'Beninese', 'Bhutanese', 'Bolivian', 'Bosnian', 'Brazilian',
    'British', 'Bruneian', 'Bulgarian', 'Burkinabé', 'Burmese', 'Burundian',
    'Cambodian', 'Cameroonian', 'Canadian', 'Cape Verdean', 'Central African',
    'Chadian', 'Chilean', 'Chinese', 'Colombian', 'Comoran', 'Congolese',
    'Costa Rican', 'Croatian', 'Cuban', 'Cypriot', 'Czech', 'Danish',
    'Djiboutian', 'Dominican', 'Dutch', 'East Timorese', 'Ecuadorian',
    'Egyptian', 'Emirati', 'English', 'Equatorial Guinean', 'Eritrean',
    'Estonian', 'Ethiopian', 'Fijian', 'Finnish', 'French', 'Gabonese',
    'Gambian', 'Georgian', 'German', 'Ghanaian', 'Greek', 'Grenadian',
    'Guatemalan', 'Guinean', 'Guyanese', 'Haitian', 'Honduran', 'Hungarian',
    'Icelandic', 'Indian', 'Indonesian', 'Iranian', 'Iraqi', 'Irish',
     'Italian', 'Ivorian', 'Jamaican', 'Japanese', 'Jordanian',
    'Kazakh', 'Kenyan', 'Kuwaiti', 'Kyrgyz', 'Laotian', 'Latvian',
    'Lebanese', 'Liberian', 'Libyan', 'Lithuanian', 'Luxembourger',
    'Malagasy', 'Malawian', 'Malaysian', 'Maldivian', 'Malian', 'Maltese',
    'Mauritanian', 'Mauritian', 'Mexican', 'Moldovan', 'Monacan',
    'Mongolian', 'Montenegrin', 'Moroccan', 'Mozambican', 'Namibian',
    'Nepalese', 'New Zealander', 'Nicaraguan', 'Nigerien', 'Nigerian',
    'North Korean', 'Norwegian', 'Omani', 'Pakistani', 'Palestinian',
    'Panamanian', 'Papua New Guinean', 'Paraguayan', 'Peruvian', 'Philippine',
    'Polish', 'Portuguese', 'Qatari', 'Romanian', 'Russian', 'Rwandan',
    'Salvadoran', 'Samoan', 'Saudi', 'Scottish', 'Senegalese', 'Serbian',
    'Seychellois', 'Sierra Leonean', 'Singaporean', 'Slovak', 'Slovenian',
    'Somali', 'South African', 'South Korean', 'Spanish', 'Sri Lankan',
    'Sudanese', 'Surinamese', 'Swazi', 'Swedish', 'Swiss', 'Syrian',
    'Taiwanese', 'Tajik', 'Tanzanian', 'Thai', 'Togolese', 'Tongan',
    'Tunisian', 'Turkish', 'Turkmen', 'Ugandan', 'Ukrainian', 'Uruguayan',
    'Uzbek', 'Venezuelan', 'Vietnamese', 'Welsh', 'Yemeni', 'Zambian',
    'Zimbabwean'];
  String? selectedNationality;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(), backgroundColor: Colors.white, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset('assets/images/carrefour_logo.png', height: 50),
              const SizedBox(height: 12),
              const Text('Create new account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              const SizedBox(height: 24),
              _buildTitleSelector(),

              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _textField(label: 'First name')),
                  const SizedBox(width: 16),
                  Expanded(child: _textField(label: 'Last name')),
                ],
              ),

              const SizedBox(height: 16),
              _textField(label: 'Email address', keyboardType: TextInputType.emailAddress),

              const SizedBox(height: 16),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/images/egypt_flag.png', width: 24),
                        const SizedBox(width: 8),
                        const Text('+20'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _textField(label: 'Phone number', keyboardType: TextInputType.phone),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              _textField(
                label: 'Password',
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(obscurePassword ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => obscurePassword = !obscurePassword),
                ),
              ),

              const SizedBox(height: 8),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info_outline, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Create a password with 8 characters, including both upper and lower case letters, and at least one number.',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              _textField(label: 'Date of birth (Optional)'),

              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
  value: selectedNationality,
  onChanged: (value) {
    selectedNationality = value!;
  },
  decoration: InputDecoration(
    labelText: 'Nationality (Optional)',
    border: OutlineInputBorder(),
  ),
  items: nationalities.map((nationality) {
    return DropdownMenuItem(
      value: nationality,
      child: Text(nationality),
    );
  }).toList(),
),

              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: agreeToTerms,
                    onChanged: (val) => setState(() => agreeToTerms = val!),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black),
                        children: [
                          const TextSpan(text: 'I agree to Carrefour’s '),
                          TextSpan(
                            text: 'Terms & conditions',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy policy',
                            style: const TextStyle(color: Colors.blue),
                          ),
                          const TextSpan(text: '.'),
                        ],
                      ),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && agreeToTerms) {
                    // Handle registration logic here
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                  fontSize: 16,
                  color: Colors.white, // Set the text color to white
                 ),
              ),
                ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Go to login
                    },
                    child: const Text('Log In', style: TextStyle(color: Colors.blue)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: titles.map((title) {
        return Row(
          children: [
            Radio<String>(
              value: title,
              groupValue: selectedTitle,
              onChanged: (val) => setState(() => selectedTitle = val),
            ),
            Text(title),
          ],
        );
      }).toList(),
    );
  }

  Widget _textField({
    required String label,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _dropdownField({
    required String label,
    required List<String> items,
    String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
    );
  }
}
