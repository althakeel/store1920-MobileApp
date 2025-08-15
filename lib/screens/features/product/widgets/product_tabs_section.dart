import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/widgets/active_button.dart';
import '../../../../global/app_color.dart';
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
              ? _buildDescriptionContent()
              : _buildReviewsContent(),
        ),
      ],
    );
  }

  Widget _buildDescriptionContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About this item
          Text(
            'About this item',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            controller.products.value.description ?? '',
            style: TextStyle(
              fontSize: 11.sp,
              color: AppColors.textGrey,
              fontWeight: FontWeight.w400,
              height: 1.5
            ),
          ),

          SizedBox(height: 24.h),
          // Specifications list
          if (controller.products.value.specifications != null) ...[
            _buildSpecificationItem(
              'Sole material',
              controller.products.value.specifications!.soleMaterial ?? '',
            ),
            _buildSpecificationItem(
              'Outer material',
              controller.products.value.specifications!.outerMaterial ?? '',
            ),
            _buildSpecificationItem(
              'Closure type',
              controller.products.value.specifications!.closureType ?? '',
            ),
            _buildSpecificationItem(
              'Water resistance level',
              controller.products.value.specifications!.waterResistanceLevel ??
                  '',
            ),
          ],

          SizedBox(height: 24.h),

          // Product details boxes
          Text(
            'Product Details',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),

          SizedBox(height: 12.h),

          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: index < 2 ? 8.w : 0),
                  height: 80.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.grid_view,
                        size: 24.sp,
                        color: Colors.grey[600],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Lorem Ipsum',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // More details
          Text(
            'More Details',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),

          SizedBox(height: 100.h), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildSpecificationItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              '$label:',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: AppColors.black),
            ),
          ),
        ],
      ),
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
                    // Reviewer name and date
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

                    SizedBox(height: 8.h),

                    // Rating
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

                    SizedBox(height: 8.h),

                    // Purchase tag
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

                    SizedBox(height: 12.h),

                    // Review text
                    Text(
                      review.text ?? '',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // Helpful section
                    Row(
                      children: [
                        Icon(
                          Icons.share_outlined,
                          size: 16.sp,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 16.w),
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
              ),
            ),

          SizedBox(height: 100.h), // Bottom padding
        ],
      ),
    );
  }
}
