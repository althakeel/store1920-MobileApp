import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../global/app_color.dart';

class InActiveButton extends StatelessWidget {
  final void Function() onTap;
  final int? selectedIndex;
  final String? btnTitle;
  final double height;
  final double width;

  const InActiveButton({
    required this.onTap,
    this.selectedIndex,
    this.btnTitle,
    this.height = 40,
    this.width = 160,
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
          color: selectedIndex == 1 ? AppColors.secondary : Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            btnTitle ?? '',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: selectedIndex == 1 ? AppColors.white : AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
