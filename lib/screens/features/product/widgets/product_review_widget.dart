import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/app_color.dart';
import '../../../../global/images.dart';
import '../models/product_model.dart';

class ProductReviewWidget extends StatelessWidget {
  final ProductModel products;

  const ProductReviewWidget({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (products.reviews != null)
            ...products.reviews!.map(
              (review) => Container(
                margin: EdgeInsets.only(bottom: 20.h),
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AppImage.companyLogo,
                                width: 21.w,
                                height: 21.h,
                              ),
                            ),
                            SizedBox(width: 5.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.name ?? '',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.black,
                                  ),
                                ),
                                Text(
                                  'on ${review.date}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            Row(
                              children: [
                                ...List.generate(
                                  5,
                                  (index) => Icon(
                                    Icons.star,
                                    color: index < (review.rating ?? 0)
                                        ? Colors.amber
                                        : Colors.grey[300],
                                    size: 16.sp,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                review.purchase ?? '',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      review.text ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.textGrey,
                        height: 1.5,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      spacing: 10,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppImage.menuIcon,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Share',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              AppImage.menuIcon,
                              color: AppColors.gray,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Helpful (${review.helpful})',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

          SizedBox(height: 100.h), // Bottom padding
        ],
      ),
    );
  }
}
