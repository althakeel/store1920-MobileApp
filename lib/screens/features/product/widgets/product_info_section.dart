import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../global/app_color.dart';
import '../../../../global/images.dart';
import '../controllers/product_detail_controller.dart';

class ProductInfoSection extends GetView<ProductDetailController> {
  const ProductInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brand: ${controller.products.value.brand ?? ''}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  controller.products.value.title ?? '',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              Text(
                '\$${controller.products.value.originalPrice}',
                style: TextStyle(
                  fontSize: 12.sp,
                  color: AppColors.textGrey,
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5.w),
              Row(
                children: [
                  Text(
                    '${controller.products.value.currentPrice}',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Image.asset(AppImage.currencyIcon, width: 13.w, height: 11.h),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
