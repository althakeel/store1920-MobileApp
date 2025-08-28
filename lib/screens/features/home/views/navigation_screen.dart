import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../global/constant_values.dart';
import '../controllers/home_controller.dart';
import '../widgets/bottom_navigation_bar.dart';

class NavigationScreen extends GetView<HomeController> {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeOut,
          child: KeyedSubtree(
            key: ValueKey<int>(controller.currentIndex.value),
            child: ConstantValue.pages[controller.currentIndex.value],
          ),
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          child: CustomBottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeIndex,
          ),
        ),
      ),
    );
  }
}
