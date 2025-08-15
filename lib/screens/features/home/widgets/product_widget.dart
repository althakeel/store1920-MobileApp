import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/app_color.dart';
import '../../../../global/images.dart';

class ProductWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String originalPrice;
  final String currentPrice;
  final String discount;
  final String sold;

  const ProductWidget({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.originalPrice,
    required this.currentPrice,
    required this.discount,
    required this.sold,
  });

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 164.w,
            height: 169.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(imageUrl, fit: BoxFit.fill),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.textGrey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Divider(thickness: 1.5, color: AppColors.borderGrey),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star_border,
                        size: 12.sp,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  Text(
                    'Sold : 0',
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textGrey,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      discount,
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImage.currencyIcon,
                        width: 11.5.w,
                        height: 10.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        originalPrice,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: AppColors.textGrey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        currentPrice,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      AppImage.cartIcon,
                      width: 8.w,
                      height: 8.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
