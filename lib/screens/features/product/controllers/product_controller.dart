import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/models/product_model.dart';
import '../../../../global/images.dart';

class ProductController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxInt currentImageIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt selectedColorIndex = 0.obs;
  RxInt quantity = 1.obs;
  Rx<ProductModel> products = Rx(ProductModel());
  RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[].obs;
  RxString selectedFilter = 'All'.obs;
  RxString selectedCategory = 'Shoes'.obs;

  final List<String> filters = ['All', 'Price', 'Rating', 'Newest', 'Popular'];
  final List<String> categories = [
    'Shoes',
    'Watches',
    'Bags',
    'Clothing',
    'Accessories',
  ];

  double calculateChildAspectRatio() {
    final screenWidth = Get.width;
    final availableWidth = screenWidth - (18.w * 2) - 18.w;
    final itemWidth = availableWidth / 2;

    return itemWidth / (itemWidth * 1.4);
  }

  final product = {
    'brand': 'Nike',
    'title': 'Nike Run Defy mens LACED SHOES',
    'originalPrice': 59.00,
    'currentPrice': 38.00,
    'rating': 4.2,
    'images': [AppImage.banner1, AppImage.banner2, AppImage.banner3],
    'sizes': ['7', '8', '9', '10'],
    'description':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'specifications': {
      'Sole material': '14% Synthetic; 86% Textile',
      'Outer material': '14% Synthetic; 86% Textile',
      'Closure type': 'Lace-Up',
      'Water resistance level': 'Not Water Resistant',
    },
    'reviews': [
      {
        'name': 'Minato Namikaze',
        'date': '12 AUG 2025',
        'rating': 5,
        'purchase': 'Purchased k01',
        'text':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'helpful': 7,
      },
    ],
  };

  @override
  void onInit() {
    products.value = ProductModel.fromJson(product);
    _loadProductList();
    super.onInit();
  }

  void _loadProductList() {
    productList.value = [
      {
        'imageUrl': AppImage.prod1,
        'title': 'Watches Mens 2022 LIGE Top Brand',
        'originalPrice': '59.00',
        'currentPrice': '45.00',
        'discount': '-24% OFF',
        'sold': '0',
        'rating': 4.5,
        'category': 'Watches',
        'isTrending': true,
      },
      {
        'imageUrl': AppImage.prod2,
        'title': 'Nike Run Defy mens LACED SHOES',
        'originalPrice': '59.00',
        'currentPrice': '38.00',
        'discount': '-36% OFF',
        'sold': '0',
        'rating': 4.2,
        'category': 'Shoes',
        'isBestChoice': true,
      },
      {
        'imageUrl': AppImage.prod3,
        'title': 'Premium Leather Handbag',
        'originalPrice': '89.00',
        'currentPrice': '67.00',
        'discount': '-25% OFF',
        'sold': '0',
        'rating': 4.8,
        'category': 'Bags',
      },
      {
        'imageUrl': AppImage.prod4,
        'title': 'Designer Sunglasses',
        'originalPrice': '120.00',
        'currentPrice': '95.00',
        'discount': '-21% OFF',
        'sold': '0',
        'rating': 4.3,
        'category': 'Accessories',
        'isBestChoice': true,
      },
      {
        'imageUrl': AppImage.prod5,
        'title': 'Casual Cargo Pants',
        'originalPrice': '45.00',
        'currentPrice': '32.00',
        'discount': '-29% OFF',
        'sold': '0',
        'rating': 4.1,
        'category': 'Clothing',
      },
      {
        'imageUrl': AppImage.prod6,
        'title': 'Smart Watch Series 5',
        'originalPrice': '199.00',
        'currentPrice': '149.00',
        'discount': '-25% OFF',
        'sold': '0',
        'rating': 4.7,
        'category': 'Watches',
        'isTrending': true,
      },
      {
        'imageUrl': AppImage.prod7,
        'title': 'Running Shoes Pro',
        'originalPrice': '85.00',
        'currentPrice': '68.00',
        'discount': '-20% OFF',
        'sold': '0',
        'rating': 4.4,
        'category': 'Shoes',
      },
      {
        'imageUrl': AppImage.prod8,
        'title': 'Leather Wallet',
        'originalPrice': '35.00',
        'currentPrice': '28.00',
        'discount': '-20% OFF',
        'sold': '0',
        'rating': 4.0,
        'category': 'Accessories',
      },
    ];
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void changeImage(int index) {
    currentImageIndex.value = index;
  }

  void selectSize(int index) {
    selectedSizeIndex.value = index;
  }

  void changeColor(int index) {
    selectedColorIndex.value = index;
  }

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void selectFilter(String filter) {
    selectedFilter.value = filter;
    _applyFilters();
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    _applyFilters();
  }

  void _applyFilters() {
    _loadProductList();

    if (selectedCategory.value != 'All') {
      productList.value = productList
          .where((product) => product['category'] == selectedCategory.value)
          .toList();
    }

    switch (selectedFilter.value) {
      case 'Price':
        productList.sort(
          (a, b) => double.parse(
            a['currentPrice'],
          ).compareTo(double.parse(b['currentPrice'])),
        );
        break;
      case 'Rating':
        productList.sort((a, b) => b['rating'].compareTo(a['rating']));
        break;
      case 'Newest':
        productList.value = productList.reversed.toList();
        break;
      case 'Popular':
        productList.sort(
          (a, b) => int.parse(b['sold']).compareTo(int.parse(a['sold'])),
        );
        break;
    }
  }
}
