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
            Padding(
              padding: EdgeInsets.fromLTRB(4.w, 12.h, 12.w, 12.h),
              child: CustomSearchBar(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text('Categories', style: subHeaderStyle),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text('Sub Categories', style: subHeaderStyle),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(child: _buildMainContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Row(
      children: [
        Expanded(child: _buildMainCategories()),
        SizedBox(width: 8.w),
        Expanded(flex: 3, child: _buildSubCategories()),
      ],
    );
  }

  Widget _buildMainCategories() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: AppColors.grey.withValues(alpha: .2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
      ),
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
            'Select a sub_category to view subcategories',
            style: subTitleStyle,
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.w,
                childAspectRatio: .8,
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
