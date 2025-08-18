import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/images.dart';
import 'package:store1920/screens/features/product/models/product_model.dart';

import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

class ProductDescWidget extends StatelessWidget {
  final ProductModel products;

  const ProductDescWidget({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.h),
          Text('About this item', style: subTitleStyle),
          Text(
            products.description ?? '',
            style: bodyStyle.copyWith(height: 1.5),
          ),
          SizedBox(height: 12.h),
          if (products.specifications != null) ...[
            _buildSpecificationItem(
              'Sole material',
              products.specifications!.soleMaterial ?? '',
            ),
            _buildSpecificationItem(
              'Outer material',
              products.specifications!.outerMaterial ?? '',
            ),
            _buildSpecificationItem(
              'Closure type',
              products.specifications!.closureType ?? '',
            ),
            _buildSpecificationItem(
              'Water resistance level',
              products.specifications!.waterResistanceLevel ?? '',
            ),
          ],
          Divider(thickness: 1.5, color: AppColors.borderGrey),
          Text('Product Details', style: subTitleStyle),
          SizedBox(height: 12.h),
          Row(
            children: List.generate(
              3,
              (index) => Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: index < 2 ? 8.w : 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImage.menuIcon,
                        width: 23.w,
                        height: 23.h,
                        color: AppColors.black,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Lorem Ipsum',
                        style: titleStyle.copyWith(fontSize: 12.sp),
                      ),
                      Text('Lorem Ipsum lorem', style: bodyStyle),
                    ],
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 24.h),
          Text('More Details', style: subHeaderStyle),
          SizedBox(height: 100.h), // Bottom padding
        ],
      ),
    );
  }

  Widget _buildSpecificationItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width * 0.5.w,
            child: Text('$label:', style: bodyStyle.copyWith()),
          ),
          Expanded(
            child: Text(
              ': $value',
              softWrap: true,
              style: bodyStyle.copyWith(height: 1.5),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
