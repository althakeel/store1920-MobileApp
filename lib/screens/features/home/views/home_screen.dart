import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/images.dart';
import 'package:store1920/screens/widgets/custom_app_bar.dart';
import '../../../../global/app_color.dart';
import '../controllers/home_controller.dart';
import '../widgets/top_bar.dart';
import '../widgets/icon_list_of_categories.dart';
import '../widgets/product_tabs_list.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/feature_cards.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(searchController: TextEditingController(),),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const TopBar(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                  child: Column(
                    spacing: 14.h,
                    children: [
                      const FeatureCards(),
                      const IconListOfCategories(),
                      _buildAdvertisementBanner(),
                      SizedBox(height: 16.h),
                      SizedBox(height: 16.h),
                      ProductTabsList(),
                      ProductListWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => CustomBottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
          ),
        ),
      ),
    );
  }

  Widget _buildAdvertisementBanner() {
    return SizedBox(
      width: 400.w,
      height: 100.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(
          AppImage.banner2,
          fit: BoxFit.fill,
          cacheWidth: 400,
          cacheHeight: 100,
        ),
      ),
    );
  }
}
