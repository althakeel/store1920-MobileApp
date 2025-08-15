import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/app_color.dart';

class IconListOfCategories extends StatelessWidget {
  const IconListOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'All Item', 'icon': Icons.category},
      {'name': 'Cream', 'icon': Icons.face},
      {'name': 'Fashion', 'icon': Icons.style},
      {'name': 'Accessories', 'icon': Icons.watch},
      {'name': 'Footwear', 'icon': Icons.sports_soccer},
      {'name': 'T-shirts', 'icon': Icons.checkroom},
      {'name': 'Jeans', 'icon': Icons.checkroom},
    ];

    return Container(
      height: 60.h,
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: ListView.builder(
        primary: true,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            width: 60.w,
            margin: EdgeInsets.only(right: 8.w),
            child: Column(
              children: [
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    categories[index]['icon'] as IconData,
                    color: AppColors.primary,
                    size: 24.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Expanded(
                  child: Text(
                    categories[index]['name'] as String,
                    style: TextStyle(
                      fontSize: 8.h,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
