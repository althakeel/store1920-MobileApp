import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

class DealProductCard extends StatelessWidget {
  final String imagePath;
  final double price;
  final String title;

  const DealProductCard({
    super.key,
    required this.imagePath,
    required this.price,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: subTitleStyle.copyWith(color: AppColors.dynamicColor),
            overflow: TextOverflow.ellipsis,
          ),
          Text('AED ${price.toStringAsFixed(2)}', style: subTitleStyle),
          SizedBox(height: 8.h),
          SizedBox(
            height: 30.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.amber,
                foregroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: subTitleStyle.copyWith(color: AppColors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
