import 'package:f10s_shopping/module/home/widgets/home_product_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../provider/api_service.dart';
import '../login/data_model/user_data_model.dart';

class HomeLogic extends GetxController {
  final double discount = 24.00;
  var userName = ''.obs;
  var userEmail = ''.obs;
  var userImageUrl = ''.obs;
  var currentIndex = 0.obs;
  final GetStorage storage = GetStorage();
  var wishlistItems = <Map<String, dynamic>>[].obs;
  var cartItems = <Map<String, dynamic>>[].obs;
  var userData = Rxn<UserDataModel>();
  var userAddress = ''.obs;
  var cardNumber = ''.obs;
  var cardHolder = ''.obs;
  var expiryDate = ''.obs;
  var cvv = ''.obs;
  var cardType = ''.obs;
  var isDefault = true.obs;
  var selectedCategory = 'all'.obs;
  var allProductsList = <ProductModel>[].obs;
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();
  var searchQuery = ''.obs;



  @override
  void onInit() {
    super.onInit();
    userName.value = storage.read('userName') ?? 'User';
    userEmail.value = storage.read('userEmail') ?? '';
    userImageUrl.value = storage.read('userProfileImage') ?? '';
    userAddress.value = storage.read('userAddress') ?? '';
    cardNumber.value = storage.read('userCardNumber') ?? '';
    cardHolder.value = storage.read('userName') ?? 'User';
    expiryDate.value = storage.read('userCardExpire') ?? '';
    cardType.value = storage.read('userCardType') ?? 'VISA';
    fetchProducts();
  }
  void setUserData({
    required String name,
    required String email,
    String imageUrl = '',
    String address = '',
    String bankCardNumber = '',
    String bankCardExpire = '',
    String bankCardType = '',
  }) {
    userName.value = name.trim().isEmpty ? 'User' : name;
    userEmail.value = email;
    userImageUrl.value = imageUrl;
    userAddress.value = address;
    cardNumber.value = bankCardNumber;
    cardHolder.value = name.trim().isEmpty ? 'User' : name;
    expiryDate.value = bankCardExpire;
    cardType.value = bankCardType.isEmpty ? 'VISA' : bankCardType;

    storage.write('userName', userName.value);
    storage.write('userEmail', email);
    storage.write('userProfileImage', imageUrl);
    storage.write('userAddress', address);
    storage.write('userCardNumber', bankCardNumber);
    storage.write('userCardExpire', bankCardExpire);
    storage.write('userCardType', cardType.value);
  }

  void updateUserData(UserDataModel newModel) {
    userData.value = newModel;

    setUserData(
      name: newModel.fullName,
      email: newModel.email,
      imageUrl: newModel.image,
      address: newModel.address?.address ?? '',
      bankCardNumber: newModel.bank?.cardNumber ?? '',
      bankCardExpire: newModel.bank?.cardExpire ?? '',
      bankCardType: newModel.bank?.cardType ?? '',
    );

    if (newModel.address != null) {
      String fullAddress = "${newModel.address!.address}, ${newModel.address!.city}, ${newModel.address!.state}";
      userAddress.value = fullAddress;
      storage.write('userAddress', fullAddress);
    }
  }




  void changePage(int index) {
    currentIndex.value = index;
  }

  var quantity1 = 4.obs;
  var quantity2 = 1.obs;
  var quantity3 = 1.obs;





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




  void updateCardNumber(String value) {
    cardNumber.value = value.isEmpty ? '' : value;
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
      double parsedPrice = 0.0;
      if (item['price'] is num) {
        parsedPrice = (item['price'] as num).toDouble();
      } else {
        parsedPrice = double.tryParse(item['price'].toString().replaceAll('\$', '')) ?? 0.0;
      }
      cartItems.add({
        'title': item['title'] ?? '',
        'subtitle': item['category'] ?? 'Standard • M',
        'price': parsedPrice,
        'quantity': 1.obs,
        'color': 0xFFE0E0E0,
        'thumbnail': item['thumbnail'] ?? '',
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
        'thumbnail': product.thumbnail ?? '',
      });
    }
  }
  void fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await _apiService.AllProduct();
      if (response != null && response.statusCode == 200) {
        var productsData = response.data['products'] as List;
        allProductsList.value = ProductModel.fromJsonList(productsData);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load products: $e");
    } finally {
      isLoading.value = false;
    }
  }

  List<ProductModel> get filteredProducts {
    List<ProductModel> tempProducts = allProductsList;
    if (selectedCategory.value != 'all') {
      tempProducts = tempProducts.where((product) {
        return product.category.toString().toLowerCase().trim() ==
            selectedCategory.value.toLowerCase().trim();
      }).toList();
    }


    if (searchQuery.value.isNotEmpty) {
      tempProducts = tempProducts.where((product) {
        final titleMatch = product.title.toString().toLowerCase().contains(searchQuery.value.toLowerCase());
        return titleMatch;
      }).toList();
    }

    return tempProducts;
  }

  void changeCategory(String categoryKey) async {
    selectedCategory.value = categoryKey;

    try {
      isLoading.value = true;


      final response = await _apiService.AllProduct();

      if (response != null && response.statusCode == 200) {
        var productsData = response.data['products'] as List;

        List<ProductModel> totalProducts = ProductModel.fromJsonList(productsData);

        if (categoryKey == 'all') {

          allProductsList.value = totalProducts;
        } else {

          allProductsList.value = totalProducts.where((product) {
            return product.category.toString().toLowerCase().trim() ==
                categoryKey.toLowerCase().trim();
          }).toList();
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to load products: $e");
    } finally {
      isLoading.value = false;
      allProductsList.refresh();
    }
  }
}

