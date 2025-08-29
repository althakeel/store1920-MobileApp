import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/screens/features/home/controllers/home_controller.dart';

import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

class IconListOfCategories extends StatelessWidget {
  const IconListOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        physics: ScrollPhysics(),
        controller: ScrollController(),
        scrollDirection: Axis.horizontal,
        itemCount: HomeController.instance.mainCategories.length,
        itemBuilder: (context, index) {
          final categories = HomeController.instance.mainCategories[index];
          return Container(
            margin: EdgeInsets.only(right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(33.r),
                  child: Image.asset(
                    categories['icon'],
                    width: 65.r,
                    height: 65.r,
                    // scale: 20,
                    // size: 28.sp,
                  ),
                ),
                SizedBox(height: 2.h),
                SizedBox(
                  width: 65.w,
                  child: Text(
                    categories['name'] as String,
                    maxLines: 2,
                    style: bodyStyle.copyWith(color: AppColors.black),
                    softWrap: true,
                    overflow: TextOverflow.visible,
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
