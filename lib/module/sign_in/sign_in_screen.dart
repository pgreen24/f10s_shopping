import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data_model/signup_data_model.dart';
import 'sign_in_logic.dart';
import 'sign_in_successfully.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _selectedGender = "Prefer not to say";
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SignInLogic logic = Get.put(SignInLogic());
    Get.lazyPut(()=>SignInLogic());
    //Get.lazyPut(()=>SignInLogic());
    Get.find<SignInLogic>();

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
              icon: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
              onPressed: () => Get.back(),
            ),
          ),
        ),
        title: const Text(
          "Sign up",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Sign up to shop your favourites and keep track of your orders.",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                ),
                const SizedBox(height: 24),

                _buildLabel("Full name"),
                _buildTextField(
                  hintText: "Enter your full name",
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Name cannot be empty";
                    }
                    return null;
                  },
                ),

                _buildLabel("Email address"),
                _buildTextField(
                  hintText: "Enter your email address",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email cannot be empty";
                    }
                    if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),

                _buildLabel("Password"),
                _buildTextField(
                  hintText: "Create a password",
                  controller: _passwordController,
                  obscureText: _isPasswordObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () => setState(
                          () => _isPasswordObscured = !_isPasswordObscured,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),

                _buildLabel("Confirm password"),
                _buildTextField(
                  hintText: "Re-enter your password",
                  controller: _confirmPasswordController,
                  obscureText: _isConfirmPasswordObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () => setState(
                          () => _isConfirmPasswordObscured =
                      !_isConfirmPasswordObscured,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Confirm password cannot be empty";
                    }
                    if (value != _passwordController.text) {
                      return "Passwords do not match";
                    }
                    return null;
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildLabel("Gender"),
                    Text(
                      "Select one option",
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
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
                _buildTextField(
                  hintText: "Enter your age in years",
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Age cannot be empty";
                    }
                    return null;
                  },
                ),

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

                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        List<String> nameParts = _nameController.text
                            .trim()
                            .split(' ');
                        String firstName = nameParts.isNotEmpty
                            ? nameParts.first
                            : '';
                        String lastName = nameParts.length > 1
                            ? nameParts.sublist(1).join(' ')
                            : '';

                        final userModel = SignupDataModel(
                          firstName: firstName,
                          lastName: lastName,
                          maidenName: '',
                          email: _emailController.text.trim(),
                          gender: _selectedGender,
                          age: int.tryParse(_ageController.text.trim()) ?? 0,
                        );

                        SignupDataModel? registeredUser = await logic
                            .registerUser(
                          userModel: userModel,
                          password: _passwordController.text,
                        );

                        if (registeredUser != null) {
                          Get.to(
                                () => const SignInSuccessfully(),
                            arguments: registeredUser,
                          );
                        }
                      }
                    },

                    child: Obx(
                          () => logic.isLoading.value
                          ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 13,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String hintText,
    required TextEditingController controller,
    required String? Function(String?)? validator,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }

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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
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