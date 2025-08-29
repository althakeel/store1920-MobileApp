import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';

import '../../../../global/app_color.dart';

class ProductImageListCarousal extends StatelessWidget {
  const ProductImageListCarousal({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 44.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.products.value.images?.length ?? 0,
                itemBuilder: (context, index) {
                  final String? img = controller.products.value.images?[index];
                  return GestureDetector(
                    onTap: () => controller.goToImage(index),
                    child: Obx(
                      () => Container(
                        width: 50.w,
                        margin: EdgeInsets.only(right: 8.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: controller.currentImageIndex.value == index
                              ? Border.all(
                                  color: AppColors.dynamicColor,
                                  width: 2,
                                )
                              : Border.all(
                                  color: AppColors.borderGrey,
                                  width: 1,
                                ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: img == null
                              ? const SizedBox.shrink()
                              : Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                  cacheWidth: 50,
                                  cacheHeight: 60,
                                ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
