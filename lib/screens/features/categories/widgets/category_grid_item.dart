import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';
import '../../../../global/app_color.dart';
import '../../../../routes/app_routes.dart';

class CategoryGridItem extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = category['isSelected'] ?? false;
    final hasBadge = category['hasBadge'] ?? false;
    final badgeIcon = category['badgeIcon'];
    final color = category['color'] ?? AppColors.primary;

    return GestureDetector(
      onTap: () {
        onTap();
        Get.toNamed(AppRoutes.productList);
      },
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              color: isSelected ? color : AppColors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected ? color : AppColors.borderGrey,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: isSelected 
                          ? AppColors.white 
                          : color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      category['icon'] as IconData,
                      size: 24.sp,
                      color: isSelected ? color : color,
                    ),
                  ),
                ),
                
                if (hasBadge && badgeIcon != null)
                  Positioned(
                    top: 8.h,
                    right: 8.w,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        badgeIcon as IconData,
                        size: 12.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            category['name'] as String,
            softWrap: true,
            style: bodyStyle.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

