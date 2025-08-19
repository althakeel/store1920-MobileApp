import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/screens/features/home/controllers/home_controller.dart';
import '../../../../global/images.dart';
import '../../../widgets/product_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {
        'imageUrl': AppImage.prod1,
        'title': 'Watches Mens 2022 LIGE Top Brand',
        'originalPrice': '59.00',
        'currentPrice': '45.00',
        'discount': '-24% OFF',
        'sold': '0',
      },
      {
        'imageUrl': AppImage.prod2,
        'title': 'Watches Mens 2022 LIGE Top Brand',
        'originalPrice': '59.00',
        'currentPrice': '45.00',
        'discount': '-24% OFF',
        'sold': '0',
      },
      {
        'imageUrl': AppImage.prod3,
        'title': 'Nike Run Defy mens LACED SHOES',
        'originalPrice': '59.00',
        'currentPrice': '38.00',
        'discount': '-36% OFF',
        'sold': '0',
      },
      {
        'imageUrl': AppImage.prod4,
        'title': 'Premium Leather Handbag',
        'originalPrice': '89.00',
        'currentPrice': '67.00',
        'discount': '-25% OFF',
        'sold': '0',
      },
    ];
    final aspectRatio = HomeController.instance.calculateChildAspectRatio();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 18.w,
        mainAxisSpacing: 18.h,
        childAspectRatio: aspectRatio,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductWidget(
          imageUrl: product['imageUrl'] ?? '',
          title: product['title'] ?? '',
          originalPrice: product['originalPrice'] ?? '',
          currentPrice: product['currentPrice'] ?? '',
          discount: product['discount'] ?? '',
          sold: product['sold'] ?? '',
        );
      },
    );
  }
}
