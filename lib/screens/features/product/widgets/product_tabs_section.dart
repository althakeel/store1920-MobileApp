import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import 'package:store1920/screens/features/product/widgets/product_desc_widget.dart';
import 'package:store1920/screens/features/product/widgets/product_review_widget.dart';
import 'package:store1920/screens/widgets/custom_button.dart';

class ProductTabsSection extends GetView<ProductController> {
  const ProductTabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => CustomButton(
                    index: 0,
                    onTap: () {
                      controller.changeTab(0);
                    },
                    selectedIndex: controller.selectedTabIndex.value,
                    btnTitle: 'Description',
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Obx(
                  () => CustomButton(
                    index: 1,
                    onTap: () {
                      controller.changeTab(1);
                    },
                    selectedIndex: controller.selectedTabIndex.value,
                    btnTitle: 'Reviews',
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Obx(
          () => controller.selectedTabIndex.value == 0
              ? ProductDescWidget(products: controller.products.value)
              : ProductReviewWidget(products: controller.products.value),
        ),
      ],
    );
  }
}
