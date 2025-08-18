import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global/app_color.dart';
import '../../global/constant_styles.dart';

class CustomButton extends StatelessWidget {
  final void Function() onTap;
  final int? selectedIndex;
  final int? index;
  final String? btnTitle;
  final double height;
  final double width;

  const CustomButton({
    required this.onTap,
    this.selectedIndex,
    this.btnTitle,
    this.index,
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
          color: selectedIndex == index
              ? AppColors.secondary
              : AppColors.borderGrey,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Center(
          child: Text(
            btnTitle ?? '',
            style: subHeaderStyle.copyWith(
              color: selectedIndex == index ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
