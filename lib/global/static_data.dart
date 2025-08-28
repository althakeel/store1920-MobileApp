import 'package:flutter/material.dart';
import 'package:store1920/global/app_color.dart';
import 'package:store1920/global/images.dart';

class StaticData {
  static final List<Map<String, dynamic>> mainCategories = [
    {'name': 'Fashion', 'icon': Icons.style, 'color': AppColors.dynamicColor},
    {'name': 'Electronics', 'icon': Icons.phone_android, 'color': AppColors.secondary},
    {'name': 'Home & Garden', 'icon': Icons.home, 'color': AppColors.dynamicColor},
    {'name': 'Sports', 'icon': Icons.sports_soccer, 'color': AppColors.secondary},
    {'name': 'Beauty', 'icon': Icons.face, 'color': AppColors.dynamicColor},
    {'name': 'Books', 'icon': Icons.book, 'color': AppColors.secondary},
  ];

  static final Map<String, List<Map<String, dynamic>>> subCategoriesMap = {
    'Fashion': [
      {'name': 'Men\'s Clothing', 'icon': AppImage.menCloth, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Women\'s Clothing', 'icon': AppImage.womenCloth, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': true, 'badgeIcon': Icons.star},
      {'name': 'Kids\' Clothing', 'icon': AppImage.menCloth, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Accessories', 'icon': AppImage.womenCloth, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': false},
    ],
    'Electronics': [
      {'name': 'Smartphones', 'icon': AppImage.electronics, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Laptops', 'icon': AppImage.electronics, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': true, 'badgeIcon': Icons.star},
      {'name': 'Accessories', 'icon': AppImage.appliances, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': false},
    ],
    'Home & Garden': [
      {'name': 'Furniture', 'icon': AppImage.toolsHome, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Garden', 'icon': AppImage.air, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Decor', 'icon': AppImage.electronics, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': false},
    ],
    'Sports': [
      {'name': 'Fitness', 'icon': AppImage.electronics, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Swimming', 'icon': AppImage.toolsHome, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': false},
    ],
    'Beauty': [
      {'name': 'Skincare', 'icon': AppImage.toolsHome, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Fragrances', 'icon': AppImage.air, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': false},
    ],
    'Books': [
      {'name': 'Fiction', 'icon': AppImage.adhesive, 'color': AppColors.dynamicColor, 'isSelected': false, 'hasBadge': false},
      {'name': 'Non-Fiction', 'icon': AppImage.air, 'color': AppColors.secondary, 'isSelected': false, 'hasBadge': false},
    ],
  };

  static final Map<String, dynamic> product = {
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
        'text': 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'helpful': 7,
      },
    ],
  };

  static final List<Map<String, dynamic>> productList = [
    {'imageUrl': AppImage.prod1, 'title': 'Watches Mens 2022 LIGE Top Brand', 'originalPrice': '59.00', 'currentPrice': '45.00', 'discount': '-24% OFF', 'sold': '0', 'rating': 4.5, 'category': 'Watches', 'isTrending': true},
    {'imageUrl': AppImage.prod2, 'title': 'Nike Run Defy mens LACED SHOES', 'originalPrice': '59.00', 'currentPrice': '38.00', 'discount': '-36% OFF', 'sold': '0', 'rating': 4.2, 'category': 'Shoes', 'isBestChoice': true},
    {'imageUrl': AppImage.prod3, 'title': 'Premium Leather Handbag', 'originalPrice': '89.00', 'currentPrice': '67.00', 'discount': '-25% OFF', 'sold': '0', 'rating': 4.8, 'category': 'Bags'},
    {'imageUrl': AppImage.prod4, 'title': 'Designer Sunglasses', 'originalPrice': '120.00', 'currentPrice': '95.00', 'discount': '-21% OFF', 'sold': '0', 'rating': 4.3, 'category': 'Accessories', 'isBestChoice': true},
    {'imageUrl': AppImage.prod5, 'title': 'Casual Cargo Pants', 'originalPrice': '45.00', 'currentPrice': '32.00', 'discount': '-29% OFF', 'sold': '0', 'rating': 4.1, 'category': 'Clothing'},
    {'imageUrl': AppImage.prod6, 'title': 'Smart Watch Series 5', 'originalPrice': '199.00', 'currentPrice': '149.00', 'discount': '-25% OFF', 'sold': '0', 'rating': 4.7, 'category': 'Watches', 'isTrending': true},
    {'imageUrl': AppImage.prod7, 'title': 'Running Shoes Pro', 'originalPrice': '85.00', 'currentPrice': '68.00', 'discount': '-20% OFF', 'sold': '0', 'rating': 4.4, 'category': 'Shoes'},
    {'imageUrl': AppImage.prod8, 'title': 'Leather Wallet', 'originalPrice': '35.00', 'currentPrice': '28.00', 'discount': '-20% OFF', 'sold': '0', 'rating': 4.0, 'category': 'Accessories'},
  ];

  static const List<String> filters = ['All', 'Price', 'Rating', 'Newest', 'Popular'];
  static const List<String> categories = ['Shoes', 'Watches', 'Bags', 'Clothing', 'Accessories'];

  static final List<Map<String, dynamic>> megaDeals = [
    {"img": AppImage.prod1, "price": 25.75, 'title': 'Watches Mens 2022 LIGE Top Brand'},
    {"img": AppImage.prod2, "price": 33.63, 'title': 'Watches Mens 2022 LIGE Top Brand'},
    {"img": AppImage.prod3, "price": 21.56, 'title': 'Nike Run Defy mens LACED SHOES'},
    {"img": AppImage.prod4, "price": 32.15, 'title': 'Premium Leather Handbag'},
  ];

  static final List<Map<String, dynamic>> colorOptions = [
    {'name': 'Red', 'image': AppImage.prod1, 'color': Colors.red},
    {'name': 'Blue', 'image': AppImage.prod2, 'color': Colors.blue},
    {'name': 'Black', 'image': AppImage.prod3, 'color': Colors.black},
    {'name': 'White', 'image': AppImage.prod4, 'color': Colors.white},
  ];
}


