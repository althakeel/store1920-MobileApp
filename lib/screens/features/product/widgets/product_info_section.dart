import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import '../../../../global/images.dart';

class ProductInfoSection extends GetView<ProductController> {
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
                  style: subTitleStyle.copyWith(fontSize: 12.sp),
                ),
                Text(
                  controller.products.value.title ?? '',
                  softWrap: true,
                  style: subHeaderStyle.copyWith(
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
                style: bodyStyle.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              SizedBox(width: 5.w),
              Row(
                children: [
                  Text(
                    '${controller.products.value.currentPrice}',
                    style: headerStyle,
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
