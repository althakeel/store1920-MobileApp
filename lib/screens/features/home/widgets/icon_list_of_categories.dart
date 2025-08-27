import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/routes/app_routes.dart';

import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

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

    return SizedBox(
      height: 65.h,
      child: ListView.builder(
        controller: ScrollController(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: index == 0
                ? () {
                    Get.toNamed(AppRoutes.allCategories);
                  }
                : () {},
            child: Container(
              margin: EdgeInsets.only(right: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 60.w,
                    padding: EdgeInsets.all(8.r),
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
                      color: AppColors.black,
                      size: 28.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Expanded(
                    child: Text(
                      categories[index]['name'] as String,
                      style: bodyStyle.copyWith(color: AppColors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
