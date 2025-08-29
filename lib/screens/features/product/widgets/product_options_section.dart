import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';

class ProductOptionsSection extends GetView<ProductController> {
  const ProductOptionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Column(
        children: [
          Row(
            children: [
            ],
          ),
        ],
      ),
    );
  }

}
