import 'package:get/get.dart';
import '../../../../global/static_data.dart';

class AllCategoriesController extends GetxController {
  RxInt selectedMainCategoryIndex = 0.obs;
  RxInt selectedSubCategoryIndex = 0.obs;

  final List<Map<String, dynamic>> mainCategories = StaticData.mainCategories;

  final Map<String, List<Map<String, dynamic>>> subCategoriesMap =
      StaticData.subCategoriesMap;

  void selectMainCategory(int index) {
    selectedMainCategoryIndex.value = index;
    selectedSubCategoryIndex.value = 0;
    update();
  }

  void selectSubCategory(int index) {
    selectedSubCategoryIndex.value = index;
    final selectedMainCategory =
        mainCategories[selectedMainCategoryIndex.value];
    final subCategories = subCategoriesMap[selectedMainCategory['name']] ?? [];

    for (int i = 0; i < subCategories.length; i++) {
      subCategories[i]['isSelected'] = (i == index);
    }

    update();
  }

  List<Map<String, dynamic>> getSubCategories(String mainCategoryName) {
    return subCategoriesMap[mainCategoryName] ?? [];
  }
}
