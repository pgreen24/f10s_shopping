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
  final GetStorage storage = GetStorage('F10S_Storage');
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
  var orders = <Map<String, dynamic>>[].obs;



  @override
  void onInit() {
    super.onInit();
    loadCurrentUserData();
    loadOrdersFromStorage();
    loadWishlistFromStorage();
    loadCartFromStorage();
    fetchProducts();
  }
  @override
  void onReady() {
    super.onReady();
    loadCurrentUserData();
  }
  void loadOrdersFromStorage() {
    String userKey = storage.read('currentUserKey') ?? storage.read('last_logged_in_user') ?? '';
    if (userKey.isEmpty) {
      orders.clear();
      return;
    }
    List<dynamic>? storedOrders = storage.read<List<dynamic>>('my_orders_list_$userKey');
    if (storedOrders != null) {
      orders.assignAll(storedOrders.map((e) => Map<String, dynamic>.from(e),).toList(),
      );
    } else {
      orders.clear();
    }
  }

  void loadCurrentUserData() {
    String userKey = storage.read('currentUserKey') ?? '';

    if (userKey.isEmpty) {
      userKey = storage.read('last_logged_in_user') ?? '';
    }

    if (userKey.isNotEmpty) {
      userName.value = storage.read('userName_$userKey') ?? 'User';
      userEmail.value = storage.read('userEmail_$userKey') ?? '';
      userImageUrl.value = storage.read('userProfileImage_$userKey') ?? '';
      userAddress.value = storage.read('userAddress_$userKey') ?? '';
      cardNumber.value = storage.read('userCardNumber_$userKey') ?? '';
      cardHolder.value = userName.value;
      expiryDate.value = storage.read('userCardExpire_$userKey') ?? '';
      cardType.value = storage.read('userCardType_$userKey') ?? 'VISA';
      storage.write('currentUserKey', userKey);

    } else {
      userName.value = 'Guest';
      userEmail.value = '';
      userImageUrl.value = '';
      userAddress.value = '';
      cardNumber.value = '';
      cardHolder.value = 'Guest';
      expiryDate.value = '';
      cardType.value = 'VISA';
    }
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
    String userKey = storage.read('currentUserKey') ?? 'default_user';

    userName.value = name.trim().isEmpty ? 'User' : name;
    userEmail.value = email;
    userImageUrl.value = imageUrl;
    userAddress.value = address;
    cardNumber.value = bankCardNumber;
    cardHolder.value = userName.value;
    expiryDate.value = bankCardExpire;
    cardType.value = bankCardType.isEmpty ? 'VISA' : bankCardType;


    storage.write('userName_$userKey', userName.value);
    storage.write('userEmail_$userKey', email);
    storage.write('userProfileImage_$userKey', imageUrl);
    storage.write('userAddress_$userKey', address);
    storage.write('userCardNumber_$userKey', bankCardNumber);
    storage.write('userCardExpire_$userKey', bankCardExpire);
    storage.write('userCardType_$userKey', cardType.value);
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
    int index = wishlistItems.indexWhere(
          (item) => item['title'] == product['title'],);

    if (index != -1) {
      wishlistItems.removeAt(index);
    } else {
      wishlistItems.add(product);
    }

    saveWishlistToStorage();
  }



  void removeFromWishlist(int index) {
    if (index >= 0 && index < wishlistItems.length) {
      wishlistItems.removeAt(index);
      saveWishlistToStorage();
    }
  }


  bool isFavorite(String title) {
    return wishlistItems.any((item) => item['title'] == title);
  }


  void addToCartFromWishlist(Map<String, dynamic> item) {
    bool isExist = cartItems.any((element) => element['title'] == item['title'],);
    if (!isExist) {
      double parsedPrice = 0.0;
      if (item['price'] is num) {parsedPrice = (item['price'] as num).toDouble();
      } else {
        parsedPrice = double.tryParse(item['price'].toString().replaceAll('\$', ''),) ?? 0.0;
      }
      cartItems.add({
        'title': item['title'] ?? '',
        'subtitle': item['category'] ?? 'Standard • M',
        'price': parsedPrice,
        'quantity': 1.obs,
        'color': 0xFFE0E0E0,
        'thumbnail': item['thumbnail'] ?? '',
      });
      saveCartToStorage();
      Get.snackbar("Success", "Added to your cart successfully!", snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar("Notice", "Item is already in your cart!", snackPosition: SnackPosition.TOP,
      );
    }
  }


  void saveWishlistToStorage() {
    String userKey = storage.read('currentUserKey') ?? '';
    if (userKey.isEmpty) return;
    storage.write('wishlistItems_$userKey', wishlistItems.toList(),);
  }

  void loadWishlistFromStorage() {
    String userKey = storage.read('currentUserKey') ?? '';
    if (userKey.isEmpty) {
      wishlistItems.clear();
      return;
    }

    List<dynamic>? savedWishlist = storage.read('wishlistItems_$userKey');
    if (savedWishlist != null) {
      wishlistItems.assignAll(savedWishlist.map((item) => Map<String, dynamic>.from(item),
        ).toList(),);
    } else {
      wishlistItems.clear();
    }
  }




  void removeFromCart(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
      saveCartToStorage();
    }
  }



  void addToCart(dynamic product, int qty) {
    double parsedPrice = double.tryParse((product.price ?? '0').toString().replaceAll('\$', ''),) ?? 0.0;
    int index = cartItems.indexWhere((item) => item['title'] == product.title,);

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
    saveCartToStorage();
  }

  void saveCartToStorage() {
    String userKey = storage.read('currentUserKey') ?? '';

    if (userKey.isEmpty) return;

    List<Map<String, dynamic>> cartData =
    cartItems.map((item) {
      return {
        'title': item['title'],
        'subtitle': item['subtitle'],
        'price': item['price'],
        'quantity': (item['quantity'] as RxInt).value,
        'color': item['color'],
        'thumbnail': item['thumbnail'],
      };
    }).toList();

    storage.write('cartItems_$userKey', cartData);
  }

  void loadCartFromStorage() {
    String userKey = storage.read('currentUserKey') ?? '';

    if (userKey.isEmpty) {
      cartItems.clear();
      return;
    }

    List<dynamic>? savedCart =
    storage.read('cartItems_$userKey');

    if (savedCart != null) {
      cartItems.assignAll(
        savedCart.map((item) {
          final data = Map<String, dynamic>.from(item);

          data['quantity'] =
              (data['quantity'] as num).toInt().obs;

          return data;
        }).toList(),
      );
    } else {
      cartItems.clear();
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
            return product.category.toString().toLowerCase().trim() == categoryKey.toLowerCase().trim();
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
  void addCompletedOrder() {
    if (cartItems.isEmpty) return;
    String userKey = storage.read('currentUserKey') ?? '';

    if (userKey.isEmpty) return;
    final newOrder = {
      'orderId': "#F10S-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}",
      'date': DateTime.now().toIso8601String(),
      'status': 'Confirmed',
      'totalPrice': totalPrice,
      'items': cartItems.map((item) => {
        'name': item['title'] ?? 'F10S Piece',
        'quantity': (item['quantity'] as RxInt).value,
        'price': item['price'] as double,
        'image': item['thumbnail'] ?? '',
      }).toList(),
    };

    orders.insert(0, newOrder);
    storage.write('my_orders_list_$userKey', orders.toList());

  }

}

