import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';

import '../../global/app_color.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
              color: AppColors.black,
            ),
          ),
          const Spacer(),
          Text(title, style: titleStyle),
          const Spacer(),
          SizedBox(width: 20.w), // Balance the back button
        ],
      ),
    );
  }
}
