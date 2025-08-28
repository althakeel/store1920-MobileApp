import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../../../../global/images.dart';

class AllCategoriesController extends GetxController {
  RxInt selectedMainCategoryIndex = 0.obs;
  RxInt selectedSubCategoryIndex = 0.obs;

  final List<Map<String, dynamic>> mainCategories = [
    {'name': 'Fashion', 'icon': Icons.style, 'color': AppColors.dynamicColor},
    {
      'name': 'Electronics',
      'icon': Icons.phone_android,
      'color': AppColors.secondary,
    },
    {'name': 'Home & Garden', 'icon': Icons.home, 'color': AppColors.dynamicColor},
    {
      'name': 'Sports',
      'icon': Icons.sports_soccer,
      'color': AppColors.secondary,
    },
    {'name': 'Beauty', 'icon': Icons.face, 'color': AppColors.dynamicColor},
    {'name': 'Books', 'icon': Icons.book, 'color': AppColors.secondary},
  ];

  // Subcategories for each main category
  final Map<String, List<Map<String, dynamic>>> subCategoriesMap = {
    'Fashion': [
      {
        'name': 'Men\'s Clothing',
        'icon': AppImage.menCloth,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Women\'s Clothing',
        'icon': AppImage.womenCloth,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': true,
        'badgeIcon': Icons.star,
      },
      {
        'name': 'Kids\' Clothing',
        'icon': AppImage.menCloth,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Accessories',
        'icon':AppImage.womenCloth,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Electronics': [
      {
        'name': 'Smartphones',
        'icon': AppImage.electronics,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Laptops',
        'icon': AppImage.electronics,
        'color': AppImage.electronics,
        'isSelected': false,
        'hasBadge': true,
        'badgeIcon': Icons.star,
      },
      {
        'name': 'Accessories',
        'icon': AppImage.appliances,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Home & Garden': [
      {
        'name': 'Furniture',
        'icon': AppImage.toolsHome,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Garden',
        'icon': AppImage.air,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Decor',
        'icon': AppImage.electronics,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Sports': [
      {
        'name': 'Fitness',
        'icon': AppImage.electronics,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Swimming',
        'icon': AppImage.toolsHome,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Beauty': [
      {
        'name': 'Skincare',
        'icon': AppImage.toolsHome,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Fragrances',
        'icon': AppImage.air,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Books': [
      {
        'name': 'Fiction',
        'icon': AppImage.adhesive,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Non-Fiction',
        'icon': AppImage.air,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
  };

  void selectMainCategory(int index) {
    selectedMainCategoryIndex.value = index;
    selectedSubCategoryIndex.value = 0;
    update();
  }

  void selectSubCategory(int index) {
    selectedSubCategoryIndex.value = index;

    // Update selection state for subcategories
    final selectedMainCategory =
        mainCategories[selectedMainCategoryIndex.value];
    final subCategories = subCategoriesMap[selectedMainCategory['name']] ?? [];

    for (int i = 0; i < subCategories.length; i++) {
      subCategories[i]['isSelected'] = (i == index);
    }

    update();

    // Navigate to subcategory products or perform other actions
    // Get.toNamed('/subcategory-products', arguments: subCategories[index]);
  }

  List<Map<String, dynamic>> getSubCategories(String mainCategoryName) {
    return subCategoriesMap[mainCategoryName] ?? [];
  }
}
