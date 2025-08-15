import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../global/app_color.dart';

class ProductTabsList extends StatelessWidget {
  const ProductTabsList({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = const [
      'All Item',
      'Shoes',
      'Shoes',
      'Shoes',
      'Shoes',
      'Shoes',
    ];
    final RxInt selectedTabIndex = RxInt(0);
    return Container(
      height: 22.h,
      margin: EdgeInsets.symmetric(vertical: 9.h),
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return Obx(
            () => RepaintBoundary(
              child: Container(
                margin: EdgeInsets.only(right: 6.w),
                child: GestureDetector(
                  onTap: () {
                    selectedTabIndex.value = index;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.grey.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                      border: Border(
                        bottom: BorderSide(
                          color: selectedTabIndex.value == index
                              ? AppColors.primary
                              : AppColors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index > 0) ...[
                          Icon(
                            Icons.shop,
                            size: 16.sp,
                            color: selectedTabIndex.value == index
                                ? AppColors.primary
                                : AppColors.grey,
                          ),
                          SizedBox(width: 4.w),
                        ],
                        Text(
                          tabs[index],
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
