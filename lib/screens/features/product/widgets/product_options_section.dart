import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';
import '../../../../global/images.dart';

class ProductOptionsSection extends GetView<ProductController> {
  const ProductOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_buildColorOptions()],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sizes', style: bodyStyle),
                          SizedBox(height: 8.h),
                          _buildSizesGrid(),
                        ],
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Qty', style: bodyStyle),
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 12.h,
                          ),
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
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                              ? AppColors.primary
                              : AppColors.borderGrey,
                          borderRadius: BorderRadius.circular(6),
                          border: controller.selectedSizeIndex.value == index
                              ? Border.all(color: AppColors.primary, width: 1.5)
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

  Widget _buildColorOptions() {
    final List<Map<String, dynamic>> colorOptions = [
      {'name': 'Red', 'image': AppImage.prod1, 'color': Colors.red},
      {'name': 'Blue', 'image': AppImage.prod2, 'color': Colors.blue},
      {'name': 'Black', 'image': AppImage.prod3, 'color': Colors.black},
      {'name': 'White', 'image': AppImage.prod4, 'color': Colors.white},
    ];

    return Obx(
          () => Row(
        children: [
          if (controller.selectedColorIndex.value > 0)
            GestureDetector(
              onTap: () => controller.changeColor(
                controller.selectedColorIndex.value - 1,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15.sp,
                color: AppColors.textGrey,
              ),
            ),
          Expanded(
            child: SizedBox(
              height: 44.h,
              width: 44.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: colorOptions.length,
                itemBuilder: (context, index) {
                  final colorOption = colorOptions[index];
                  return GestureDetector(
                    onTap: () => controller.changeColor(index),
                    child: Container(
                      width: 50.w,
                      margin: EdgeInsets.only(right: 8.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: controller.selectedColorIndex.value == index
                            ? Border.all(color: AppColors.primary, width: 2)
                            : Border.all(color: AppColors.borderGrey, width: 1),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.asset(
                          colorOption['image'],
                          fit: BoxFit.cover,
                          cacheWidth: 50,
                          cacheHeight: 60,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (controller.selectedColorIndex.value < colorOptions.length - 1)
            GestureDetector(
              onTap: () => controller.changeColor(
                controller.selectedColorIndex.value + 1,
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15.sp,
                color: AppColors.textGrey,
              ),
            ),
        ],
      ),
    );
  }
}
