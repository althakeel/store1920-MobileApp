import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global/app_color.dart';

class ActiveButton extends StatelessWidget {
  final void Function() onTap;
  final int? selectedIndex;
  final String? btnTitle;
  final double height;
  final double width;

  const ActiveButton({
    required this.onTap,
    this.selectedIndex,
    this.btnTitle,
    this.height = 30,
    this.width = 190,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          color: selectedIndex == 0 ? AppColors.secondary : AppColors.borderGrey,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            btnTitle ?? '',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 0 ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
