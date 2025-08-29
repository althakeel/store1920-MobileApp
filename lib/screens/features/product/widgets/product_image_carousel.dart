import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import '../../../../global/app_color.dart';
import 'product_header.dart';

class ProductImageCarousel extends GetView<ProductController> {
  const ProductImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Get.height * .4,
          child: Stack(
            children: [
              PageView.builder(
                controller: controller.imagePageController,
                onPageChanged: controller.changeImage,
                itemCount: controller.products.value.images?.length ?? 0,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Image.asset(
                      controller.products.value.images?[index] ?? '',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
              const Positioned(
                top: -10,
                left: 0,
                right: 0,
                child: ProductHeader(),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: Obx(() {
                  final int total =
                      controller.products.value.images?.length ?? 0;
                  final int current = total == 0
                      ? 0
                      : controller.currentImageIndex.value + 1;
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.dynamicColor.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '$current/$total',
                      style: bodyStyle.copyWith(color: AppColors.white),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 18.w),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: List.generate(
        //             controller.products.value.images?.length ?? 0,
        //                 (index) => Obx(
        //                   () => Container(
        //                 margin: EdgeInsets.only(right: 8.w),
        //                 width: controller.currentImageIndex.value == index
        //                     ? 12.w
        //                     : 8.w,
        //                 height: 8.h,
        //                 decoration: BoxDecoration(
        //                   color: controller.currentImageIndex.value == index
        //                       ? AppColors.dynamicColor
        //                       : AppColors.dynamicColor.withValues(alpha: 0.3),
        //                   borderRadius: BorderRadius.circular(4),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // SizedBox(height: 10.h),
        Container(
          height: 26.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.dynamicColor.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
