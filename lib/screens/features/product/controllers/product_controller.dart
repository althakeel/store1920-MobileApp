import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/models/product_model.dart';
import 'package:store1920/global/static_data.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();
  RxInt selectedTabIndex = 0.obs;
  RxInt currentImageIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt selectedColorIndex = 0.obs;
  RxInt quantity = 1.obs;
  Rx<ProductModel> products = Rx(ProductModel());
  RxList<Map<String, dynamic>> productList = <Map<String, dynamic>>[].obs;
  RxString selectedCategory = 'All'.obs;

  List<String> get categories {
    final all = List<Map<String, dynamic>>.from(StaticData.listOfProducts);
    final unique = <String>{'All'};
    for (final p in all) {
      final sc = p['sub_category'];
      if (sc is String && sc.isNotEmpty) unique.add(sc);
    }
    return unique.toList();
  }

  double calculateChildAspectRatio() {
    final screenWidth = Get.width;
    final availableWidth = screenWidth - (18.w * 2) - 18.w;
    final itemWidth = availableWidth / 2;

    return itemWidth / (itemWidth * 1.4);
  }

  Map<String, dynamic>? initialProduct;
  final PageController imagePageController = PageController();

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is Map &&
        args['subCategory'] is String &&
        (args['subCategory'] as String).isNotEmpty) {
      selectedCategory.value = args['subCategory'];
    }
    if (args is Map && args['productId'] != null) {
      final String id = args['productId'];
      initialProduct = StaticData.listOfProducts.firstWhere(
        (p) => p['id'] == id,
        orElse: () => StaticData.listOfProducts.first,
      );
    } else {
      initialProduct = StaticData.listOfProducts.first;
    }
    products.value = ProductModel.fromJson(initialProduct!);
    _applyFilters();
    super.onInit();
  }

  @override
  void onClose() {
    imagePageController.dispose();
    super.onClose();
  }

  void _loadProductList() {
    productList.value = List<Map<String, dynamic>>.from(
      StaticData.listOfProducts,
    );
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void changeImage(int index) {
    currentImageIndex.value = index;
  }

  void goToImage(int index) {
    imagePageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    changeImage(index);
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
    // Filters removed
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
    _applyFilters();
  }

  void _applyFilters() {
    _loadProductList();
    if (selectedCategory.value != 'All') {
      productList.value = productList
          .where((product) => product['sub_category'] == selectedCategory.value)
          .toList();
    }
  }
}
