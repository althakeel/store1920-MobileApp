import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

class CategoryItemWidget extends StatelessWidget {
  final Map<String, dynamic> category;
  final int index;
  final int selectedMainCategoryIndex;
  final void Function()? onTap;

  const CategoryItemWidget({
    required this.category,
    required this.index,
    required this.selectedMainCategoryIndex,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedMainCategoryIndex == index;
    return GestureDetector(
      onTap: () => onTap != null ? onTap!() : () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.dynamicColor.withValues(alpha: .8)
              : AppColors.white.withValues(alpha: .5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                category['name'] as String,
                style: bodyStyle.copyWith(
                  color: isSelected ? AppColors.white : AppColors.black,
                ),
              ),
            ),
            if (isSelected)
              Icon(
                Icons.arrow_forward_ios,
                size: 12.sp,
                color: AppColors.white,
              ),
          ],
        ),
      ),
    );
  }
}
