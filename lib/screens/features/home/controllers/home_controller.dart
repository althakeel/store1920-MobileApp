import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:store1920/screens/features/auth/controller/loader_controller.dart';

import '../../../../global/static_data.dart';

class HomeController extends LoaderController {
  static HomeController get instance => Get.find();
  final List<Map<String, dynamic>> mainCategories = StaticData.mainCategories;
  RxInt currentIndex = 0.obs;
  RxDouble scrollOffset = 0.0.obs;
  final RxString dealsCountdownText = ''.obs;
  late DateTime _dealsEndTime;
  Timer? _dealsTimer;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void updateScrollOffset(double offset) {
    scrollOffset.value = offset;
  }

  double calculateChildAspectRatio() {
    final screenWidth = Get.width;
    final availableWidth = screenWidth - (18.w * 2) - 18.w;
    final itemWidth = availableWidth / 2;

    return itemWidth / (itemWidth * 1.4);
  }

  @override
  void onInit() {
    super.onInit();
    _dealsEndTime = DateTime.now().add(
      const Duration(hours: 23, minutes: 2, seconds: 48),
    );
    _updateDealsCountdown();
    _dealsTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateDealsCountdown(),
    );
  }

  void _updateDealsCountdown() {
    final Duration remaining = _dealsEndTime.difference(DateTime.now());
    if (remaining.isNegative) {
      _dealsEndTime = DateTime.now().add(const Duration(hours: 24));
      return;
    }
    final int hours = remaining.inHours;
    final int minutes = remaining.inMinutes % 60;
    final int seconds = remaining.inSeconds % 60;
    final String formatted =
        '${hours.toString().padLeft(2, '0')}h : ${minutes.toString().padLeft(2, '0')}m : ${seconds.toString().padLeft(2, '0')}s';
    if (dealsCountdownText.value != formatted) {
      dealsCountdownText.value = formatted;
    }
  }

  @override
  void onClose() {
    _dealsTimer?.cancel();
    super.onClose();
  }
}
