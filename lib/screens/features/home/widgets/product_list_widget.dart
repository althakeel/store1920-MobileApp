import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/screens/features/home/controllers/home_controller.dart';
import 'package:store1920/global/static_data.dart';
import '../../../widgets/product_widget.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final products = List<Map<String, dynamic>>.from(StaticData.listOfProducts);
    final aspectRatio = HomeController.instance.calculateChildAspectRatio();
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 9.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.w,
        // mainAxisSpacing: 18.h,
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
