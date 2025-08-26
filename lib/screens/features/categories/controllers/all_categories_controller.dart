import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';

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
        'icon': Icons.checkroom,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Women\'s Clothing',
        'icon': Icons.checkroom,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': true,
        'badgeIcon': Icons.star,
      },
      {
        'name': 'Kids\' Clothing',
        'icon': Icons.child_care,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Accessories',
        'icon': Icons.watch,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Footwear',
        'icon': Icons.sports_soccer,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': true,
        'badgeIcon': Icons.local_fire_department,
      },
      {
        'name': 'Jewelry',
        'icon': Icons.diamond,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Electronics': [
      {
        'name': 'Smartphones',
        'icon': Icons.phone_android,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Laptops',
        'icon': Icons.laptop,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': true,
        'badgeIcon': Icons.star,
      },
      {
        'name': 'Tablets',
        'icon': Icons.tablet_android,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Accessories',
        'icon': Icons.headphones,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Home & Garden': [
      {
        'name': 'Furniture',
        'icon': Icons.chair,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Kitchen',
        'icon': Icons.kitchen,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Garden',
        'icon': Icons.local_florist,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Decor',
        'icon': Icons.lightbulb,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Sports': [
      {
        'name': 'Fitness',
        'icon': Icons.fitness_center,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Outdoor',
        'icon': Icons.hiking,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Team Sports',
        'icon': Icons.sports_basketball,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Swimming',
        'icon': Icons.pool,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Beauty': [
      {
        'name': 'Skincare',
        'icon': Icons.face,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Makeup',
        'icon': Icons.brush,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Hair Care',
        'icon': Icons.content_cut,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Fragrances',
        'icon': Icons.air,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
    ],
    'Books': [
      {
        'name': 'Fiction',
        'icon': Icons.book,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Non-Fiction',
        'icon': Icons.menu_book,
        'color': AppColors.secondary,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Educational',
        'icon': Icons.school,
        'color': AppColors.dynamicColor,
        'isSelected': false,
        'hasBadge': false,
      },
      {
        'name': 'Children\'s',
        'icon': Icons.child_care,
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
