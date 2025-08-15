import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/images.dart';
import '../../../../global/app_color.dart';
import '../controllers/home_controller.dart';
import '../widgets/top_bar.dart';
import '../widgets/icon_list_of_categories.dart';
import '../widgets/product_tabs_list.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/bottom_navigation_bar.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    horizontal: 18.w,
                  ),
                  child: Column(
                    children: [
                      const IconListOfCategories(),
                      _buildAdvertisementBanner(),
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
      width: 339.w,
      height: 89.h,
      child: Image.asset(
        AppImage.banner1,
        fit: BoxFit.fill,
        cacheWidth: 339,
        cacheHeight: 89,
      ),
    );
  }
}
