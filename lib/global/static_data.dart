import 'package:flutter/material.dart';
import 'package:store1920/global/app_color.dart';
import 'package:store1920/global/images.dart';

class StaticData {
  static final List<Map<String, dynamic>> mainCategories = [
    {
      'name': 'Sports & Outdoors',
      'icon': AppImage.sportsOutdoor,
      'color': AppColors.secondary,
    },
    {
      'name': 'Tools & Home Improvement',
      'icon': AppImage.toolsHome,
      'color': AppColors.secondary,
    },
    {
      'name': 'Men\'s Clothing',
      'icon': AppImage.menCloth,
      'color': AppColors.secondary,
    },
    {
      'name': 'Women\'s Clothing',
      'icon': AppImage.womenClothing,
      'color': AppColors.secondary,
    },
    {
      'name': 'Electronics',
      'icon': AppImage.electronics,
      'color': AppColors.secondary,
    },
    {
      'name': 'Beauty & Outdoor',
      'icon': AppImage.beautyOutdoors,
      'color': AppColors.secondary,
    },
    {
      'name': 'Smart Home',
      'icon': AppImage.smartHome,
      'color': AppColors.dynamicColor,
    },
    {
      'name': 'Appliances',
      'icon': AppImage.appliance,
      'color': AppColors.secondary,
    },
    {
      'name': 'Automotive',
      'icon': AppImage.automative,
      'color': AppColors.dynamicColor,
    },

    {
      'name': 'Cell Phone & Accessories',
      'icon': AppImage.cellPhone,
      'color': AppColors.secondary,
    },

    {
      'name': 'Pet Supplies',
      'icon': AppImage.petSupplies,
      'color': AppColors.secondary,
    },
    {'name': 'Toys', 'icon': AppImage.toys, 'color': AppColors.dynamicColor},
  ];

  static final Map<String, List<Map<String, dynamic>>> subCategories = {
    'Men\'s Clothing': [
      {
        'name': 'Men\'s T-Shirts',
        'icon': AppImage.prod7,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Men\'s Jackets & Coats',
        'icon': AppImage.prod6,
        'color': AppColors.secondary,
      },
      {'name': 'Bags', 'icon': AppImage.prod3, 'color': AppColors.dynamicColor},
      {
        'name': 'Men\'s Casual Pants',
        'icon': AppImage.prod5,
        'color': AppColors.secondary,
      },
      {
        'name': 'Men\'s Polos',
        'icon': AppImage.prod4,
        'color': AppColors.dynamicColor,
      },
    ],
    'Women\'s Clothing': [
      {
        'name': 'Women\'s Dresses',
        'icon': AppImage.prod7,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Women\'s T-Shirts',
        'icon': AppImage.prod6,
        'color': AppColors.secondary,
      },
      {'name': 'Bags', 'icon': AppImage.prod3, 'color': AppColors.dynamicColor},
      {
        'name': 'Women\'s Coats & Jackets',
        'icon': AppImage.prod5,
        'color': AppColors.secondary,
      },
      {
        'name': 'Women\'s Pants',
        'icon': AppImage.prod4,
        'color': AppColors.dynamicColor,
      },
    ],
    'Electronics': [
      {
        'name': 'Smartphones',
        'icon': AppImage.subElectronics,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Laptops',
        'icon': AppImage.subElectronics,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Accessories',
        'icon': AppImage.appliances,
        'color': AppColors.secondary,
      },
      {
        'name': 'Watches',
        'icon': AppImage.appliances,
        'color': AppColors.secondary,
      },
    ],
    'Tools & Home Improvement': [
      {
        'name': 'Wallpaper',
        'icon': AppImage.subToolsHome,
        'color': AppColors.dynamicColor,
      },
      {'name': 'Garden', 'icon': AppImage.air, 'color': AppColors.dynamicColor},
      {
        'name': 'Decor',
        'icon': AppImage.subElectronics,
        'color': AppColors.secondary,
      },
    ],
    'Sports & Outdoors': [
      {
        'name': 'Fitness',
        'icon': AppImage.subElectronics,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Swimming',
        'icon': AppImage.subToolsHome,
        'color': AppColors.secondary,
      },
      {
        'name': 'Shoes',
        'icon': AppImage.subToolsHome,
        'color': AppColors.secondary,
      },
    ],
    'Beauty & Outdoor': [
      {
        'name': 'Skincare',
        'icon': AppImage.subToolsHome,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Bags',
        'icon': AppImage.air,
        'color': AppColors.secondary,
      },
      {
        'name': 'Accessories',
        'icon': AppImage.air,
        'color': AppColors.secondary,
      },
    ],
    'Smart Home': [
      {
        'name': 'Smart Lighting',
        'icon': AppImage.adhesive,
        'color': AppColors.dynamicColor,
      },
      {
        'name': 'Smart Devices',
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
      'mainCategory': 'Electronics',
      'sub_category': 'Watches',
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
      'mainCategory': 'Sports & Outdoors',
      'sub_category': 'Shoes',
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
      'mainCategory': 'Beauty & Outdoor',
      'sub_category': 'Bags',
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
      'mainCategory': 'Beauty & Outdoor',
      'sub_category': 'Accessories',
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
      'sub_category': 'Men\'s Casual Pants',
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
      'mainCategory': 'Electronics',
      'sub_category': 'Watches',
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
      'mainCategory': 'Sports & Outdoors',
      'sub_category': 'Shoes',
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
      'mainCategory': 'Beauty & Outdoor',
      'sub_category': 'Accessories',
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
