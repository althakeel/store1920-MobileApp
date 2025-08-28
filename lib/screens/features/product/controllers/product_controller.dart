import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/models/product_model.dart';
import 'package:store1920/global/static_data.dart';

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

  final List<String> filters = StaticData.filters;
  final List<String> categories = StaticData.categories;

  double calculateChildAspectRatio() {
    final screenWidth = Get.width;
    final availableWidth = screenWidth - (18.w * 2) - 18.w;
    final itemWidth = availableWidth / 2;

    return itemWidth / (itemWidth * 1.4);
  }

  final product = StaticData.product;

  @override
  void onInit() {
    products.value = ProductModel.fromJson(product);
    _loadProductList();
    super.onInit();
  }

  void _loadProductList() {
    productList.value = List<Map<String, dynamic>>.from(StaticData.productList);
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
