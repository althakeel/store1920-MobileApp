import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';
import '../../global/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  final bool isBack;
  final String hintSearch;

  const CustomSearchBar({
    this.isBack = false,
    this.hintSearch = 'Store1920',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (isBack)
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(CupertinoIcons.back),
          )
        else
          SizedBox(width: 6.w),
        SizedBox(width: 6.w),
        Expanded(
          child: Container(
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
                hintText: 'Search $hintSearch',
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
          ),
        ),
      ],
    );
  }
}
