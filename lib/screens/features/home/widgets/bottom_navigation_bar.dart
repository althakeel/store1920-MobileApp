import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:store1920/global/images.dart';
import '../../../../global/app_color.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: AppImage.homeSvg,
            unSelectedIcon: AppImage.unHomeSvg,
            label: 'Home',
            index: 0,
          ),
          _buildNavItem(
            icon: AppImage.shopSvg,
            unSelectedIcon: AppImage.unShopSvg,
            label: 'Shop',
            index: 1,
          ),
          _buildNavItem(
            icon: AppImage.categorySvg,
            unSelectedIcon: AppImage.unCategorySvg,
            label: 'Categories',
            index: 2,
          ),
          _buildNavItem(
            icon: AppImage.profileSvg,
            unSelectedIcon: AppImage.unProfileSvg,
            label: 'Profile',
            index: 3,
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String unSelectedIcon,
    required String label,
    required int index,
  }) {
    final isSelected = currentIndex == index;
    return Semantics(
      label: label,
      selected: isSelected,
      button: true,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(index),
          borderRadius: BorderRadius.circular(12.r),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 680),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 2.h, horizontal: 6.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      width: 24.r,
                      height: 24.r,
                      isSelected ? icon : unSelectedIcon,
                      colorFilter: ColorFilter.mode(
                        isSelected ? AppColors.dynamicColor : AppColors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 680),
                      curve: Curves.easeInOut,
                      style: TextStyle(
                        color: isSelected
                            ? AppColors.dynamicColor
                            : Colors.grey,
                        fontSize: 14.sp,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w200,
                      ),
                      child: Text(label),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
