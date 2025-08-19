import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/product/controllers/product_controller.dart';
import '../../../../global/app_color.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/product_info_section.dart';
import '../widgets/product_options_section.dart';
import '../widgets/product_tabs_section.dart';

class ProductDetailScreen extends GetView<ProductController> {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const ProductImageCarousel(),
                    const ProductOptionsSection(),
                    SizedBox(height: 10.h),
                    const ProductInfoSection(),
                    SizedBox(height: 10.h),
                    const ProductTabsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
