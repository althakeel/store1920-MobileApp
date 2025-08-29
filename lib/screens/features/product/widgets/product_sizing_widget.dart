import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';

import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

class ProductSizingWidget extends StatelessWidget {
  ProductSizingWidget({super.key});

  final controller = ProductController.instance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Text('Sizes', style: subTitleStyle),
          SizedBox(height: 8.h),
          _buildSizesGrid(),
        ],
      ),
    );
  }

  Widget _buildSizesGrid() {
    final sizes = controller.products.value.sizes ?? [];
    final int maxSizesPerRow = 4;

    return Column(
      children: List.generate((sizes.length / maxSizesPerRow).ceil(), (
        rowIndex,
      ) {
        final startIndex = rowIndex * maxSizesPerRow;
        final endIndex = (startIndex + maxSizesPerRow).clamp(0, sizes.length);
        final rowSizes = sizes.sublist(startIndex, endIndex);

        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex < (sizes.length / maxSizesPerRow).ceil() - 1
                ? 4.h
                : 0,
          ),
          child: Row(
            spacing: 5.w,
            children: rowSizes.map((size) {
              final index = startIndex + rowSizes.indexOf(size);
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: rowSizes.indexOf(size) < rowSizes.length - 1
                        ? 2.w
                        : 0,
                  ),
                  child: Obx(
                    () => GestureDetector(
                      onTap: () => controller.selectSize(index),
                      child: Container(
                        height: 24.h,
                        decoration: BoxDecoration(
                          color: controller.selectedSizeIndex.value == index
                              ? AppColors.dynamicColor
                              : AppColors.borderGrey,
                          borderRadius: BorderRadius.circular(6),
                          border: controller.selectedSizeIndex.value == index
                              ? Border.all(
                                  color: AppColors.dynamicColor,
                                  width: 1.5,
                                )
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            size,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: controller.selectedSizeIndex.value == index
                                  ? AppColors.white
                                  : AppColors.textGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}
