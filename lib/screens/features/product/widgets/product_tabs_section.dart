import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/widgets/product_desc_widget.dart';
import 'package:store1920/screens/widgets/active_button.dart';
import '../../../../global/app_color.dart';
import '../../../../global/images.dart';
import '../../../widgets/in_active_button.dart';
import '../controllers/product_detail_controller.dart';

class ProductTabsSection extends GetView<ProductDetailController> {
  const ProductTabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => ActiveButton(
                    onTap: () {
                      controller.changeTab(0);
                    },
                    selectedIndex: controller.selectedTabIndex.value,
                    btnTitle: 'Description',
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Obx(
                  () => InActiveButton(
                    onTap: () {
                      controller.changeTab(1);
                    },
                    selectedIndex: controller.selectedTabIndex.value,
                    btnTitle: 'Reviews',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        // Tab content
        Obx(
          () => controller.selectedTabIndex.value == 0
              ? ProductDescWidget(products: controller.products.value)
              : _buildReviewsContent(),
        ),
      ],
    );
  }

  Widget _buildReviewsContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Reviews list
          if (controller.products.value.reviews != null)
            ...controller.products.value.reviews!.map(
              (review) => Container(
                margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              review.name ?? '',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                            ),
                            Text(
                              'on ${review.date}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: index < (review.rating ?? 0)
                                        ? Colors.amber
                                        : Colors.grey[300],
                                    size: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                review.purchase ?? '',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),

                    Text(
                      review.text ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Row(
                      spacing: 10,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                             AppImage.menuIcon,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColors.gray,thickness: 1.5,),
                        Row(
                          children: [
                            Image.asset(
                              AppImage.menuIcon,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Helpful (${review.helpful})',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          SizedBox(height: 100.h), // Bottom padding
        ],
      ),
    );
  }
}
