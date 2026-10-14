import 'package:f10s_shopping/module/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/apps_color.dart';
import '../home_logic.dart';

class HomeProfile extends GetView<HomeLogic> {
  const HomeProfile ({super.key});


  @override
  Widget build (BuildContext context){
    final logic = Get.put(HomeLogic());
    return Material(
      child: SafeArea(
        child: Column(
          children: [

            Expanded(
              child:SingleChildScrollView(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 10.0,
                  bottom: 170.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildRoundButton(Icons.arrow_back_ios_new, () {
                          controller.changePage(2);
                        }),
                        Column(
                          children: [
                            const Text(
                              "Account Profile",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        _buildRoundButton(Icons.tune, () {}),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Center(
                    child:CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 55,
                    ),

                    ),
                    const SizedBox(height: 15),
                    Center(child: Text("Rabeya Akter Lima",style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),)),
                    Center(child: Text("lima123@gmail.com",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),)),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Container(
                          width: 144,
                          height: 90,
                          decoration: BoxDecoration(
                            color: AppsColor.grey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(

                                  "12",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                                ),
                                Text(
                                    "orders",style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                )
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 144,
                          height: 90,
                          decoration: BoxDecoration(
                            color: AppsColor.grey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child:Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "3",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                )
                                ),
                                Text(
                                    "wishlist",style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                )
                                ),
                              ],
                            ),

                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 144,
                          height: 90,
                          decoration: BoxDecoration(
                            color: AppsColor.grey,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "5.0",style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    )
                                    ),
                                    const SizedBox(width: 5),
                                    Icon(Icons.star, color: Colors.orange, size: 15),
                                  ],
                                ),
                                Text(
                                    "Reviews",style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                )
                                ),
                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                    const SizedBox(height: 15),
          SizedBox(
            height: 140,
            width: 500,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xFF161616),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: const Color(0xFF222222),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Icon(
                          Icons.local_shipping_outlined,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0C2417),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                  child: Text(
                                    "ON THE WAY",
                                    style: TextStyle(
                                      color: Color(0xFF4ADE80),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Order #2143",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Light Dress Bless",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Arriving Tomorrow, by 7 PM",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    ClipOval(
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          color: Color(0xFF222222),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
                    Text("ACCOUNT OVERVIEW",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.shopping_bag_outlined),
                                ),
                              ),
                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "My Orders",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "View history & active orders",
                                      style: TextStyle(color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),

                              Card(
                                elevation: 0,
                                color: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Text("1 active", style: TextStyle(fontSize: 12)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.location_on_outlined),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Shipping Addresses",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "2 addresses saved",
                                      style: TextStyle(color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),
                              Text("Default: Home", style: TextStyle(color: Colors.grey.shade500)),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.credit_card_outlined),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Payment Cards",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        ColoredBox(
                                          color: Colors.blue.shade800,
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                            child: Text(
                                              "VISA",
                                              style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Text("•••• 2143", style: TextStyle(color: Colors.grey.shade500)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                            ],
                          ),
                        ],
                      ),
                    ),
                   const SizedBox(height: 15),
                    Text("PREFERENCE & STYLING",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.all(16),

                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.favorite_border),
                                ),
                              ),
                              const SizedBox(width: 16),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Favourites & wishlist",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "3 saved items",
                                      style: TextStyle(color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),

                              Card(
                                elevation: 0,
                                color: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                  child: Text("1 active", style: TextStyle(fontSize: 12)),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.notifications_none_outlined),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Notifications",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "order updates & promotions",
                                      style: TextStyle(color: Colors.grey.shade500),
                                    ),
                                  ],
                                ),
                              ),
                              Obx(() => Switch.adaptive(
                                value: logic.isDefault.value,
                                onChanged: (val) => logic.isDefault.value = val,
                                activeColor: Colors.black,
                              )),
                            ],
                          ),

                          const SizedBox(height: 24),

                          Row(
                            children: [
                              SizedBox(
                                width: 48,
                                height: 48,
                                child: Card(
                                  elevation: 0,
                                  color: Colors.transparent,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.grey.shade200),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(Icons.question_mark),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "customer Support",
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4),

                                        Text("FAQ,returns & live chat", style: TextStyle(color: Colors.grey.shade500)),

                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey.shade400),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => const LoginPage());

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppsColor.whiteGray,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Log out',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
}
