import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../../../widgets/custom_search_bar.dart';
import '../../../widgets/product_widget.dart';
import '../controllers/product_controller.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({super.key});

  double _calculateChildAspectRatio() => controller.calculateChildAspectRatio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          spacing: 20.h,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(8.w, 12.h, 12.w, 0),
              child: CustomSearchBar(
                isBack: true,
                hintSearch: controller.selectedCategory.value,
              ),
            ),
            // _buildFilterSection(),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
    );
  }

  // Widget _buildFilterSection() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
  //     child: Row(children: [Expanded(child: FilterSection())]),
  //   );
  // }

  Widget _buildProductGrid() {
    return Obx(() {
      final aspectRatio = _calculateChildAspectRatio();
      if (controller.productList.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_off, size: 48.sp, color: AppColors.textGrey),
              SizedBox(height: 8.h),
              Text(
                'No products found for ${controller.selectedCategory.value}',
                style: TextStyle(fontSize: 14.sp, color: AppColors.textGrey),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }
      return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 18.w,
          mainAxisSpacing: 18.h,
          childAspectRatio: aspectRatio,
        ),
        itemCount: controller.productList.length,
        itemBuilder: (context, index) {
          final product = controller.productList[index];
          return ProductWidget(
            productId: product['id'],
            imageUrl: product['imageUrl'],
            title: product['title'],
            originalPrice: product['originalPrice'],
            currentPrice: product['currentPrice'],
            discount: product['discount'],
            sold: product['sold'],
          );
        },
      );
    });
  }
}
