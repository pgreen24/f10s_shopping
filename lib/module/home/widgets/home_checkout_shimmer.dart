import 'package:f10s_shopping/module/home/home_logic.dart';
import 'package:f10s_shopping/module/shimmer/shimmer_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_checkout.dart';

class CheckoutShimmerPage extends GetView<HomeLogic> {
  const CheckoutShimmerPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
          Get.off(() => const HomeCheckout());
      });
    });
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRoundPlaceholder(),
                        Container(width: 80, height: 16, decoration: _shimmerDecoration()),
                        _buildRoundPlaceholder(icon: Icons.menu),
                      ],
                    ),
                    const SizedBox(height: 40),


                    _buildProductShimmerRow(),
                    const SizedBox(height: 20),


                    _buildProductShimmerRow(),
                    const SizedBox(height: 70),


                    Container(width:  200, height: 14, decoration: _shimmerDecoration(color: Colors.black)),
                    const SizedBox(height: 40),


                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(width: 110, height: 70, decoration: _shimmerDecoration(color: Colors.grey.shade300)),
                          const SizedBox(width: 14),
                          Text(
                            "•••• •••• •••• 2143",
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.grey.shade600),
                          ),
                          const Spacer(),
                          Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade400),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),


                    _buildPriceShimmerRow(widthLeft: 90, widthRight: 60),
                    const SizedBox(height: 12),
                    _buildPriceShimmerRow(widthLeft: 80, widthRight: 40),
                    const SizedBox(height: 12),
                    _buildPriceShimmerRow(widthLeft: 60, widthRight: 40),
                    const SizedBox(height: 24),


                    _buildPriceShimmerRow(widthLeft: 80, widthRight: 60),
                  ],
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 20.0),
              child: Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF232323),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  BoxDecoration _shimmerDecoration({Color? color}) {
    return BoxDecoration(
      color: color ?? Colors.black,
      borderRadius: BorderRadius.circular(8),
    );
  }


  Widget _buildRoundPlaceholder({IconData icon = Icons.arrow_back_ios_new}) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Icon(icon, color: Colors.black, size: 16),
    );
  }

  Widget _buildProductShimmerRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: const Color(0xFFEBEBEB),
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Container(width: 140, height: 14, decoration: _shimmerDecoration()),
              const SizedBox(height: 8),
              Container(width: 90, height: 10, decoration: _shimmerDecoration(color: Colors.grey.shade600)),
              const SizedBox(height: 12),
              Container(width: 55, height: 12, decoration: _shimmerDecoration()),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(Icons.more_horiz, color: Colors.grey.shade400, size: 20),
            const SizedBox(height: 16),
            Row(
              children: [
                _buildCircleIndicator(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle)),
                ),
                _buildCircleIndicator(isPlus: true),
              ],
            )
          ],
        )
      ],
    );

  }


  Widget _buildCircleIndicator({bool isPlus = false}) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Center(
        child: Icon(isPlus ? Icons.add : Icons.remove, size: 12, color: Colors.grey.shade600),
      ),
    );
  }


  Widget _buildPriceShimmerRow({required double widthLeft, required double widthRight}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(width: widthLeft, height: 12, decoration: _shimmerDecoration()),
        Container(width: widthRight, height: 12, decoration: _shimmerDecoration()),
      ],
    );
  }
}
