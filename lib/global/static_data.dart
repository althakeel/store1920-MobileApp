import 'package:flutter/material.dart';
import 'package:store1920/global/app_color.dart';
import 'package:store1920/global/images.dart';

class StaticData {
  static final List<Map<String, dynamic>> mainCategories = [
    {'name': 'Fashion', 'icon': Icons.style, 'color': AppColors.dynamicColor},
    {
      'name': 'Electronics',
      'icon': Icons.phone_android,
      'color': AppColors.secondary,
    },
    {
      'name': 'Home & Garden',
      'icon': Icons.home,
      'color': AppColors.dynamicColor,
    },
    {
      'name': 'Sports',
      'icon': Icons.sports_soccer,
      'color': AppColors.secondary,
    },
    {'name': 'Beauty', 'icon': Icons.face, 'color': AppColors.dynamicColor},
    {'name': 'Books', 'icon': Icons.book, 'color': AppColors.secondary},
  ];

  static final Map<String, List<Map<String, dynamic>>> subCategories = {
    'Fashion': [
      {
        'name': 'Shoes',
        'icon': AppImage.prod7,
        'color': AppColors.dynamicColor,
      },
      {'name': 'Watches', 'icon': AppImage.prod6, 'color': AppColors.secondary},
      {'name': 'Bags', 'icon': AppImage.prod3, 'color': AppColors.dynamicColor},
      {
        'name': 'Clothing',
        'icon': AppImage.prod5,
        'color': AppColors.secondary,
      },
      {
        'name': 'Accessories',
        'icon': AppImage.prod4,
        'color': AppColors.dynamicColor,
      },
    ],
    'Electronics': [
      {
        'name': 'Smartphones',
        'icon': AppImage.electronics,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Laptops',
        'icon': AppImage.electronics,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Accessories',
        'icon': AppImage.appliances,
        'color': AppColors.secondary,
      },
    ],
    'Home & Garden': [
      {
        'name': 'Furniture',
        'icon': AppImage.toolsHome,
        'color': AppColors.dynamicColor,
      },
      {'name': 'Garden', 'icon': AppImage.air, 'color': AppColors.dynamicColor},
      {
        'name': 'Decor',
        'icon': AppImage.electronics,
        'color': AppColors.secondary,
      },
    ],
    'Sports': [
      {
        'name': 'Fitness',
        'icon': AppImage.electronics,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Swimming',
        'icon': AppImage.toolsHome,
        'color': AppColors.secondary,
      },
    ],
    'Beauty': [
      {
        'name': 'Skincare',
        'icon': AppImage.toolsHome,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Fragrances',
        'icon': AppImage.air,
        'color': AppColors.secondary,
      },
    ],
    'Books': [
      {
        'name': 'Fiction',
        'icon': AppImage.adhesive,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Non-Fiction',
        'icon': AppImage.air,
        'color': AppColors.secondary,
      },
    ],
  };

  static final List<Map<String, dynamic>> listOfProducts = [
    {
      'id': 'p1',
      'imageUrl': AppImage.prod1,
      'title': 'Watches Mens 2022 LIGE Top Brand',
      'originalPrice': '59.00',
      'currentPrice': '45.00',
      'discount': '-24% OFF',
      'sold': '0',
      'rating': 4.5,
      'mainCategory': 'Fashion',
      'subcategory': 'Watches',
      'category': 'Watches',
      'isTrending': true,
      'images': [AppImage.prod1, AppImage.prod6, AppImage.prod3],
      'sizes': ['S', 'M', 'L', 'XL'],
      'colorOptions': [
        {'name': 'Red', 'image': AppImage.prod1, 'color': Colors.red},
        {'name': 'Blue', 'image': AppImage.prod2, 'color': Colors.blue},
        {'name': 'Black', 'image': AppImage.prod3, 'color': Colors.black},
        {'name': 'White', 'image': AppImage.prod4, 'color': Colors.white},
      ],
    },
    {
      'id': 'p2',
      'imageUrl': AppImage.prod2,
      'title': 'Nike Run Defy mens LACED SHOES',
      'originalPrice': '59.00',
      'currentPrice': '38.00',
      'discount': '-36% OFF',
      'sold': '0',
      'rating': 4.2,
      'mainCategory': 'Fashion',
      'subcategory': 'Shoes',
      'category': 'Shoes',
      'isBestChoice': true,
      'images': [AppImage.banner1, AppImage.banner2, AppImage.banner3],
      'sizes': ['7', '8', '9', '10'],
      'colorOptions': [
        {'name': 'Red', 'image': AppImage.prod1, 'color': Colors.red},
        {'name': 'Blue', 'image': AppImage.prod2, 'color': Colors.blue},
        {'name': 'Black', 'image': AppImage.prod3, 'color': Colors.black},
      ],
    },
    {
      'id': 'p3',
      'imageUrl': AppImage.prod3,
      'title': 'Premium Leather Handbag',
      'originalPrice': '89.00',
      'currentPrice': '67.00',
      'discount': '-25% OFF',
      'sold': '0',
      'rating': 4.8,
      'mainCategory': 'Fashion',
      'subcategory': 'Bags',
      'category': 'Bags',
    },
    {
      'id': 'p4',
      'imageUrl': AppImage.prod4,
      'title': 'Designer Sunglasses',
      'originalPrice': '120.00',
      'currentPrice': '95.00',
      'discount': '-21% OFF',
      'sold': '0',
      'rating': 4.3,
      'mainCategory': 'Fashion',
      'subcategory': 'Accessories',
      'category': 'Accessories',
      'isBestChoice': true,
    },
    {
      'id': 'p5',
      'imageUrl': AppImage.prod5,
      'title': 'Casual Cargo Pants',
      'originalPrice': '45.00',
      'currentPrice': '32.00',
      'discount': '-29% OFF',
      'sold': '0',
      'rating': 4.1,
      'mainCategory': 'Fashion',
      'subcategory': 'Clothing',
      'category': 'Clothing',
    },
    {
      'id': 'p6',
      'imageUrl': AppImage.prod6,
      'title': 'Smart Watch Series 5',
      'originalPrice': '199.00',
      'currentPrice': '149.00',
      'discount': '-25% OFF',
      'sold': '0',
      'rating': 4.7,
      'mainCategory': 'Fashion',
      'subcategory': 'Watches',
      'category': 'Watches',
      'isTrending': true,
    },
    {
      'id': 'p7',
      'imageUrl': AppImage.prod7,
      'title': 'Running Shoes Pro',
      'originalPrice': '85.00',
      'currentPrice': '68.00',
      'discount': '-20% OFF',
      'sold': '0',
      'rating': 4.4,
      'mainCategory': 'Fashion',
      'subcategory': 'Shoes',
      'category': 'Shoes',
    },
    {
      'id': 'p8',
      'imageUrl': AppImage.prod8,
      'title': 'Leather Wallet',
      'originalPrice': '35.00',
      'currentPrice': '28.00',
      'discount': '-20% OFF',
      'sold': '0',
      'rating': 4.0,
      'mainCategory': 'Fashion',
      'subcategory': 'Accessories',
      'category': 'Accessories',
    },
  ];

  static final List<Map<String, dynamic>> dealsProd = [
    {
      "img": AppImage.prod1,
      "price": 25.75,
      'title': 'Watches Mens 2022 LIGE Top Brand',
      'productId': 'p1',
    },
    {
      "img": AppImage.prod2,
      "price": 33.63,
      'title': 'Watches Mens 2022 LIGE Top Brand',
      'productId': 'p2',
    },
    {
      "img": AppImage.prod3,
      "price": 21.56,
      'title': 'Nike Run Defy mens LACED SHOES',
      'productId': 'p3',
    },
    {
      "img": AppImage.prod4,
      "price": 32.15,
      'title': 'Premium Leather Handbag',
      'productId': 'p4',
    },
  ];
}
