import 'package:f10s_shopping/module/home/home_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePaymentMethod extends GetView<HomeLogic> {
  const HomePaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    final nameController = TextEditingController(text: logic.cardHolder.value);
    final numberController = TextEditingController(
      text: logic.cardNumber.value,
    );
    final expireController = TextEditingController(
      text: logic.expiryDate.value,
    );

    nameController.text = logic.cardHolder.value;
    numberController.text = logic.cardNumber.value;
    expireController.text = logic.expiryDate.value;

    return Material(
      color: Colors.grey.shade50,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 40.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top App Bar Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRoundButton(
                          Icons.arrow_back_ios_new,
                          () => Get.back(),
                        ),
                        const Text(
                          "Payment Methods",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        _buildRoundButton(Icons.qr_code_scanner, () {}),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Payment Type Tabs
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _buildTabButton("Cards", Icons.credit_card, true),
                          const SizedBox(width: 12),
                          _buildTabButton(
                            "Apple Pay",
                            Icons.phone_iphone,
                            false,
                          ),
                          const SizedBox(width: 12),
                          _buildTabButton("PayPal", Icons.payment, false),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    // --- Live Credit Card Preview ---
                    Container(
                      width: double.infinity,
                      height: 210,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 45,
                                height: 35,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFD4AF37),
                                      Color(0xFFAA7C11),
                                      Color(0xFF8B6508),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(6),

                                  border: Border.all(
                                    color: const Color(0xFF8B6508),
                                    width: 1.5,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Container(
                                        width: 25,
                                        height: 35,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            left: BorderSide(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                            right: BorderSide(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        width: 45,
                                        height: 15,
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                            bottom: BorderSide(
                                              color: Colors.black,
                                              width: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Row(
                                children: [
                                  const Icon(
                                    Icons.wifi,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 12),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.15),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Obx(
                                      () => Text(
                                        logic.cardType.value.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // Live Card Number Binding
                          Obx(() {
                            String rawNum = logic.cardNumber.value;

                            String formatted = rawNum.isEmpty
                                ? "•••• •••• •••• 2143"
                                : rawNum;
                            return Text(
                              formatted,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2,
                              ),
                            );
                          }),
                          // Live Cardholder Name & Expiry Bindings
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "CARDHOLDER",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Obx(
                                    () => Text(
                                      logic.cardHolder.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "EXPIRES",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 9,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Obx(
                                    () => Text(
                                      logic.expiryDate.value,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Cardholder Name Input
                    const Text(
                      "Cardholder Name",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: nameController,
                      onChanged: logic.updateCardHolder,
                      decoration: _inputDecoration(
                        hintText: "Enter Name",
                        prefixIcon: Icons.person_outline,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Card Number Input
                    const Text(
                      "Card Number",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      onChanged: logic.updateCardNumber,
                      decoration: _inputDecoration(
                        hintText: "4242 •••• •••• 2143",
                        prefixIcon: Icons.credit_card,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Expires & CVV Row
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Expires",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                controller: expireController,
                                onChanged: logic.updateExpiryDate,
                                decoration: _inputDecoration(
                                  hintText: "08/26",
                                  prefixIcon: Icons.calendar_today_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "CVV / CVC",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Icon(
                                    Icons.help_outline,
                                    size: 16,
                                    color: Colors.grey.shade400,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              TextField(
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                decoration: _inputDecoration(
                                  hintText: "•••",
                                  prefixIcon: Icons.lock_outline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Default Card Switch Box
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.verified_outlined,
                              size: 20,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Set as default card",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Text(
                                  "Use for single-click checkouts",
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Obx(
                            () => Switch.adaptive(
                              value: logic.isDefault.value,
                              onChanged: (val) => logic.isDefault.value = val,
                              activeColor: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Security Indicator
                    const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.lock_outline,
                            size: 14,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "End-to-end 256–bit encrypted security",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_outline, size: 20),
                            SizedBox(width: 8),
                            Text(
                              "Save & Add Card",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Bottom Link Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.credit_card_outlined,
                          size: 16,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "2 existing payment methods linked",
                          style: TextStyle(fontSize: 13, color: Colors.black87),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Manage",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade200, width: 1),
        ),
        child: Icon(icon, color: Colors.black, size: 18),
      ),
    );
  }

  Widget _buildTabButton(String title, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isSelected ? Colors.grey.shade200 : Colors.transparent,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required String hintText,
    required IconData prefixIcon,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
      prefixIcon: Icon(prefixIcon, color: Colors.grey.shade500, size: 20),
      suffixIcon: suffixIcon != null
          ? Icon(suffixIcon, color: Colors.grey.shade500, size: 20)
          : null,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Colors.black, width: 1),
      ),
    );
  }
}
