import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../global/app_color.dart';
import '../../global/constant_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderGrey),
      ),
      child: Row(
        children: [
          Icon(Icons.search, size: 20.sp, color: AppColors.textGrey),
          SizedBox(width: 12.w),
          Expanded(child: Text('Search Store 1920', style: subTitleStyle)),
          Icon(
            Icons.search,
            size: 20.sp,
            color: AppColors.textGrey,
          ),
        ],
      ),
    );
  }
}
