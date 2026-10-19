import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeLogic extends GetxController {
  var userName = ''.obs;
  var userEmail = ''.obs;
  var currentIndex = 0.obs;
  final GetStorage storage = GetStorage();
  var wishlistItems = <Map<String, dynamic>>[].obs;
  var cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    userName.value = storage.read('userName') ?? 'User';
    userEmail.value = storage.read('userEmail') ?? '';
  }
  void setUserData({required String name, required String email}) {
    userName.value = name;
    userEmail.value = email;

    storage.write('userName', name);
    storage.write('userEmail', email);
  }



  void changePage(int index) {
    currentIndex.value = index;
  }


  var quantity1 = 4.obs;
  var quantity2 = 1.obs;
  var quantity3 = 1.obs;

  final double price1 = 212.99;
  final double price2 = 162.99;
  final double price3 = 24.00;
  final double discount = 24.00;


  double get totalPrice {
    double subtotal = 0;
    if (cartItems.isEmpty) {
      return 0.0;
    }
    for (var item in cartItems) {
      subtotal += (item['price'] as double) * (item['quantity'].value as int);
    }
    return subtotal - discount;
  }


  var cardNumber = ''.obs;
  var cardHolder = ''.obs;
  var expiryDate = ''.obs;
  var cvv = ''.obs;
  var isDefault = true.obs;

  void updateCardNumber(String value) {
    cardNumber.value = value;
  }

  void updateCardHolder(String value) {
    cardHolder.value = value.isEmpty ? '' : value;
  }

  void updateExpiryDate(String value) {
    expiryDate.value = value.isEmpty ? '' : value;
  }

  void toggleWishlist(Map<String, dynamic> product) {
    int index = wishlistItems.indexWhere((item) => item['title'] == product['title']);
    if (index != -1) {
      wishlistItems.removeAt(index);
    } else {
      wishlistItems.add(product);
    }
  }

  void removeFromWishlist(int index) {
    if (index >= 0 && index < wishlistItems.length) {
      wishlistItems.removeAt(index);
    }
  }

  bool isFavorite(String title) {
    return wishlistItems.any((item) => item['title'] == title);
  }

  void addToCartFromWishlist(Map<String, dynamic> item) {
    bool isExist = cartItems.any((element) => element['title'] == item['title']);
    if (!isExist) {
      double parsedPrice = double.tryParse(
          (item['price'] ?? '0').toString().replaceAll('\$', '')) ?? 50.0;
      cartItems.add({
        'title': item['title'] ?? '',
        'subtitle': item['category'] ?? 'Standard • M',
        'price': parsedPrice,
        'quantity': 1.obs,
        'color': 0xFFE0E0E0,
      });
      Get.snackbar("Success", "Added to your cart successfully!",
          snackPosition: SnackPosition.TOP);
    } else {
      Get.snackbar("Notice", "Item is already in your cart!",
          snackPosition: SnackPosition.TOP);
    }
  }


  void removeFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  void addToCart(dynamic product, int qty) {

    double parsedPrice = double.tryParse(
        (product.price ?? '0').toString().replaceAll('\$', '')) ?? 0.0;


    int index = cartItems.indexWhere((item) => item['title'] == product.title);

    if (index != -1) {

      cartItems[index]['quantity'].value += qty;
    } else {

      cartItems.add({
        'title': product.title ?? '',
        'subtitle': product.category ?? 'Standard • M',
        'price': parsedPrice,
        'quantity': qty.obs,
        'color': 0xFFE0E0E0,
      });
    }
  }

}

