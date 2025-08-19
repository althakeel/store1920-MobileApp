import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/screens/features/auth/controller/loader_controller.dart';

class HomeController extends LoaderController {
  static HomeController get instance => Get.find();

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  double calculateChildAspectRatio() {
    final screenWidth = Get.width;
    final availableWidth = screenWidth - (18.w * 2) - 18.w;
    final itemWidth = availableWidth / 2;

    return itemWidth / (itemWidth * 1.4);
  }
}
