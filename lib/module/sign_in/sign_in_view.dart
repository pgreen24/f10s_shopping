import 'package:f10s_shopping/module/sign_in/sign_in_successfully.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/apps_color.dart';
import '../login/login_view.dart';
import 'sign_in_logic.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String _selectedGender = "Prefer not to say";

  @override
  Widget build(BuildContext context) {
    final SignInLogic logic = Get.put(SignInLogic());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey.shade100,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: const Text(
          "Sign up",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade100,
              child: IconButton(
                icon: const Icon(Icons.menu, size: 20, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Create an account",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              Text(
                "Sign up to shop your favourites and keep track of your orders.",
                style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 24),

              _buildLabel("Full name"),
              _buildTextField(hintText: "Enter your full name"),

              _buildLabel("Email address"),
              _buildTextField(hintText: "Enter your email address"),

              _buildLabel("Password"),
              _buildTextField(
                hintText: "Create a password",
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),

              _buildLabel("Confirm password"),
              _buildTextField(
                hintText: "Re-enter your password",
                obscureText: true,
                suffixIcon: const Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLabel("Gender"),
                  Text("Select one option", style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
                ],
              ),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _genderOption("Female")),
                        Expanded(child: _genderOption("Male")),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: _genderOption("Non-binary")),
                        Expanded(child: _genderOption("Prefer not to say")),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              _buildLabel("Age"),
              _buildTextField(hintText: "Enter your age in years", keyboardType: TextInputType.number),

              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF222021),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.to(() => const SignInSuccessfully());
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const LoginPage());
                          },
                          child: const Text(
                            "Log In",
                            style: TextStyle(
                              color: AppsColor.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }

  // জেন্ডার অপশন মেথডটি এখন ক্লাসের ভেতরে সঠিকভাবে রাখা হয়েছে
  Widget _genderOption(String title) {
    bool isSelected = _selectedGender == title;
    return InkWell(
      onTap: () => setState(() => _selectedGender = title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: isSelected,
                onChanged: (val) => setState(() => _selectedGender = title),
                activeColor: const Color(0xFF222021),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                side: BorderSide(color: Colors.grey.shade400),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.black : Colors.grey.shade700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}