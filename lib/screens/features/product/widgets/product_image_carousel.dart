import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../controllers/product_detail_controller.dart';
import 'product_header.dart';

class ProductImageCarousel extends GetView<ProductDetailController> {
  const ProductImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.h,
          child: Stack(
            children: [
              PageView.builder(
                onPageChanged: controller.changeImage,
                itemCount: controller.products.value.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 18.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        controller.products.value.images?[index] ?? '',
                        fit: BoxFit.cover,
                        cacheWidth: 339,
                        cacheHeight: 300,
                      ),
                    ),
                  );
                },
              ),
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ProductHeader(),
              ),
            ],
          ),
        ),

        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.products.value.images?.length ?? 0,
                    (index) => Obx(
                      () => Container(
                        margin: EdgeInsets.only(right: 8.w),
                        width: controller.currentImageIndex.value == index
                            ? 12.w
                            : 8.w,
                        height: 8.h,
                        decoration: BoxDecoration(
                          color: controller.currentImageIndex.value == index
                              ? AppColors.primary
                              : AppColors.primary.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: AppColors.amber, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    '${controller.products.value.rating}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }
}
