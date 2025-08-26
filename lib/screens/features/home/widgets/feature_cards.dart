import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/global/app_color.dart';

class FeatureCards extends StatelessWidget {
  const FeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.32),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.gradient1.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildFeatureCard(
              icon: Icons.local_shipping,
              title: 'Free Shipping',
              subtitle: 'On unlimited orders',
            ),
          ),
          SizedBox(
            height: 50.h,
            child: VerticalDivider(
              thickness: 0.8.sp,
              color: AppColors.black,
            ),
          ),
          Expanded(
            child: _buildFeatureCard(
              icon: Icons.refresh,
              title: 'Free Returns',
              subtitle: 'Up to 90 days',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal:  12.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(icon, color: AppColors.black, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.green.withValues( green: .5),
                    fontSize: 16.sp,
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.9),
                    fontSize: 12.sp,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
