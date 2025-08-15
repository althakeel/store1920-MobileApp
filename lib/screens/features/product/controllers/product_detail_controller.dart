import 'package:get/get.dart';
import 'package:store1920/screens/features/product/models/product_model.dart';

import '../../../../global/images.dart';

class ProductDetailController extends GetxController {
  RxInt selectedTabIndex = 0.obs;
  RxInt currentImageIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  RxInt quantity = 1.obs;
  Rx<ProductModel> products = Rx(ProductModel());
  final product = {
    'brand': 'Nike',
    'title': 'Nike Run Defy mens LACED SHOES',
    'originalPrice': 59.00,
    'currentPrice': 38.00,
    'rating': 4.2,
    'images': [
      AppImage.banner1,
      AppImage.banner2,
      AppImage.banner3,
    ],
    'sizes': ['7', '8', '9', '10'],
    'description':
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum is the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
    'specifications': {
      'Sole material': '14% Synthetic; 86% Textile',
      'Outer material': 'Textile',
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
    // TODO: implement onInit
    products.value = ProductModel.fromJson(product);
    super.onInit();
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

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }
}
