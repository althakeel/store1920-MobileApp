import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../../../widgets/custom_search_bar.dart';
import '../../../widgets/product_widget.dart';
import '../controllers/product_controller.dart';
import '../widgets/filter_section.dart';

class ProductListScreen extends GetView<ProductController> {
  const ProductListScreen({super.key});

  double _calculateChildAspectRatio() {
    final screenWidth = Get.width;
    final availableWidth = screenWidth - (18.w * 2) - 18.w;
    final itemWidth = availableWidth / 2;

    return itemWidth / (itemWidth * 1.4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // CustomAppBar(title: 'Product List'),
            CustomSearchBar(),
            _buildFilterSection(),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      child: Row(children: [Expanded(child: FilterSection())]),
    );
  }

  Widget _buildProductGrid() {
    return Obx(() {
      final aspectRatio = _calculateChildAspectRatio();
      
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
