import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import 'package:store1920/screens/features/product/widgets/product_image_list_carousal.dart';
import 'package:store1920/screens/features/product/widgets/product_sizing_widget.dart';
import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/product_info_section.dart';
import '../widgets/product_options_section.dart';
import '../widgets/product_tabs_section.dart';
import '../../../widgets/product_widget.dart';

class ProductDetailScreen extends GetView<ProductController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: const ProductImageCarousel()),
            SliverToBoxAdapter(child: const ProductOptionsSection()),
            SliverToBoxAdapter(child: ProductImageListCarousal()),
            SliverToBoxAdapter(child: ProductSizingWidget()),
            SliverToBoxAdapter(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Qty', style: bodyStyle),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    color: AppColors.borderGrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: controller.decreaseQuantity,
                        child: Icon(
                          Icons.remove,
                          size: 14.sp,
                          color: AppColors.textGrey,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Obx(
                            () => Text(
                          '${controller.quantity.value}',
                          style: subTitleStyle,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      GestureDetector(
                        onTap: controller.increaseQuantity,
                        child: Icon(
                          Icons.add,
                          size: 14.sp,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(child: const ProductInfoSection()),
            SliverToBoxAdapter(child: SizedBox(height: 10.h)),
            SliverToBoxAdapter(child: const ProductTabsSection()),
            SliverToBoxAdapter(child: SizedBox(height: 16.h)),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Text(
                  'Related Products',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 12.h),
              sliver: Obx(() {
                final String? currentId = controller.initialProduct?['id'];
                final String? subCat =
                    controller.initialProduct?['sub_category'];
                List<Map<String, dynamic>> related = controller.productList
                    .where(
                      (p) =>
                          p['sub_category'] == subCat && p['id'] != currentId,
                    )
                    .toList();
                if (related.isEmpty) {
                  related = controller.productList
                      .where((p) => p['id'] != currentId)
                      .toList();
                }
                final aspectRatio = controller.calculateChildAspectRatio();
                return SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 18.h,
                    childAspectRatio: aspectRatio,
                  ),
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final product = related[index];
                    return ProductWidget(
                      productId: product['id'],
                      imageUrl: product['imageUrl'] ?? '',
                      title: product['title'] ?? '',
                      originalPrice: product['originalPrice'] ?? '',
                      currentPrice: product['currentPrice'] ?? '',
                      discount: product['discount'] ?? '',
                      sold: product['sold'] ?? '',
                    );
                  }, childCount: related.length),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
