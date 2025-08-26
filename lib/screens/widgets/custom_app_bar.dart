import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/app_color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final VoidCallback? onCartTap;
  final VoidCallback? onSearchTap;
  final double? height;
  final TextEditingController? searchController;
  final String? searchHint;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.showBackButton = false,
    this.onCartTap,
    this.onSearchTap,
    this.searchController,
    this.searchHint,
    this.height,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackButton)
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
                color: AppColors.black,
              ),
            ),
          if (showBackButton) SizedBox(width: 12.w),
          Expanded(
            child: GestureDetector(
              onTap: onSearchTap,
              child: Container(
                height: 36.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: AppColors.grey.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: searchController != null
                          ? TextField(
                              controller: searchController,
                              decoration: InputDecoration(
                                hintText: searchHint ?? 'Search products',
                                hintStyle: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                suffixIcon: Icon(
                                  Icons.search,
                                  size: 24.sp,
                                  color: AppColors.black,
                                ),
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.all(8.sp)
                              ),
                            )
                          : Text(
                              searchHint ?? 'Search products',
                              style: TextStyle(
                                color: AppColors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          GestureDetector(
            onTap: onCartTap,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 20.sp,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    (height ?? kToolbarHeight) + (bottom?.preferredSize.height ?? 0),
  );
}
