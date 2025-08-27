import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/categories/widgets/category_item_widget.dart';
import 'package:store1920/screens/widgets/custom_search_bar.dart';
import '../../../../global/app_color.dart';
import '../../../../global/constant_styles.dart';
import '../controllers/all_categories_controller.dart';
import '../widgets/category_grid_item.dart';

class AllCategoriesScreen extends GetView<AllCategoriesController> {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // CustomAppBar(title: 'All Categories'),
            CustomSearchBar(),
            SizedBox(height: 20.h),
            Expanded(child: _buildMainContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        children: [
          Expanded(flex: 1, child: _buildMainCategories()),
          SizedBox(width: 16.w),
          Expanded(flex: 3, child: _buildSubCategories()),
        ],
      ),
    );
  }

  Widget _buildMainCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: subHeaderStyle),
        SizedBox(height: 12.h),
        Expanded(
          child: ListView.builder(
            itemCount: controller.mainCategories.length,
            itemBuilder: (context, index) {
              final category = controller.mainCategories[index];
              return Obx(
                () => CategoryItemWidget(
                  category: category,
                  index: index,
                  selectedMainCategoryIndex:
                      controller.selectedMainCategoryIndex.value,
                  onTap: () => controller.selectMainCategory(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSubCategories() {
    return Obx(() {
      final selectedCategory = controller.selectedMainCategoryIndex.value >= 0
          ? controller.mainCategories[controller
                .selectedMainCategoryIndex
                .value]
          : null;

      if (selectedCategory == null) {
        return Center(
          child: Text(
            'Select a category to view subcategories',
            style: subTitleStyle,
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Sub Categories', style: subHeaderStyle),
          SizedBox(height: 12.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.8,
              ),
              itemCount: controller
                  .getSubCategories(selectedCategory['name'])
                  .length,
              itemBuilder: (context, index) {
                final subCategory = controller.getSubCategories(
                  selectedCategory['name'],
                )[index];
                return CategoryGridItem(
                  category: subCategory,
                  onTap: () => controller.selectSubCategory(index),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
