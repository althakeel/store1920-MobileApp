import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../controllers/product_controller.dart';

class FilterSection extends GetView<ProductController> {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildFilterButton(),
            SizedBox(width: 12.w),
            Expanded(child: _buildCategoryFilters()),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.filter_list,
            size: 16.sp,
            color: AppColors.white,
          ),
          SizedBox(width: 4.w),
          Text(
            'Filter',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return SizedBox(
      height: 32.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          final category = controller.categories[index];
          return Obx(() {
            final isSelected = controller.selectedCategory.value == category;
            return GestureDetector(
              onTap: () => controller.selectCategory(category),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.borderGrey,
                    width: 1,
                  ),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
