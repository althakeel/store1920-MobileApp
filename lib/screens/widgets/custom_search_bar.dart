import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/global/constant_styles.dart';
import '../../global/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.black, width: 1),
        borderRadius: BorderRadius.circular(18.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: 'winter blanket',
          hintStyle: bodyStyle.copyWith(fontSize: 14.sp),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
          suffixIcon: Icon(
            Icons.search,
            color: AppColors.textGrey,
            size: 21.sp,
          ),
          suffixIconConstraints: BoxConstraints(
            minHeight: 40.h,
            minWidth: 36.w,
          ),
        ),
      ),
    );
  }
}
