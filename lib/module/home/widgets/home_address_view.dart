import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_logic.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeLogic = Get.find<HomeLogic>();

    // পেজটি লোড হওয়ার সাথে সাথে ডায়ালগ বক্সটি দেখানোর জন্য PostFrameCallback ব্যবহার করা হয়েছে
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: const Row(
            children: [
              Icon(Icons.location_on, color: Colors.black),
              SizedBox(width: 8),
              Text("User Address", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Obx(() => Text(
            homeLogic.userAddress.value,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          )),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("Close", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipping Addresses", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.grey.shade50,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Saved Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade200),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(() => Text(
                  homeLogic.userAddress.value,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
