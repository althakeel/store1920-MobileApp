import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../controllers/product_detail_controller.dart';

class ProductOptionsSection extends GetView<ProductDetailController> {
  const ProductOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sizes section
          Text(
            'Sizes',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
          ),

          SizedBox(height: 12.h),

          // Size grid
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: List.generate(
              controller.products.value.sizes?.length ?? 0,
              (index) => Obx(
                () => GestureDetector(
                  onTap: () => controller.selectSize(index),
                  child: Container(
                    width: 60.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: controller.selectedSizeIndex.value == index
                          ? AppColors.primary
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: controller.selectedSizeIndex.value == index
                          ? Border.all(color: AppColors.primary, width: 2)
                          : null,
                    ),
                    child: Center(
                      child: Text(
                        controller.products.value.sizes?[index] ?? '',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: controller.selectedSizeIndex.value == index
                              ? AppColors.white
                              : AppColors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24.h),

          // Quantity section
          Row(
            children: [
              Text(
                'Qty',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),

              SizedBox(width: 24.w),

              // Quantity selector
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    // Decrease button
                    GestureDetector(
                      onTap: controller.decreaseQuantity,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Icon(
                          Icons.remove,
                          size: 20.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ),

                    // Quantity display
                    SizedBox(
                      width: 60.w,
                      height: 40.h,
                      child: Obx(
                        () => Center(
                          child: Text(
                            '${controller.quantity.value}',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Increase button
                    GestureDetector(
                      onTap: controller.increaseQuantity,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: AppColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}
