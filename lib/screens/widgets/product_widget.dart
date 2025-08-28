import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';
import '../../../../global/images.dart';
import '../../../../routes/app_routes.dart';

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
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.productDetail),
      child: RepaintBoundary(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 175.h,
              width: 180.w,
              child: Image.asset(imageUrl, fit: BoxFit.fill),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, right: 4.0, left: 4.0),
              child: Text(
                title,
                style: subHeaderStyle.copyWith(fontSize: 14.sp),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: 5.h),
            Column(
              spacing: 8.h,
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        discount,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImage.currencyIcon,
                            width: 11.5.w,
                            height: 10.h,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            currentPrice,
                            style: titleStyle.copyWith(fontSize: 16.sp),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Icon(Icons.shopping_cart_outlined, size: 18.sp,)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
