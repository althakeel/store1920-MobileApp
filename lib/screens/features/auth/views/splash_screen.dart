import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store1920/routes/app_routes.dart';
import '../../../../global/app_color.dart';
import '../../../../global/images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      Get.offAllNamed(AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: Get.height,
        child: Center(
          child: Image.asset(AppImage.companyLogo, width: Get.width * .7),
        ),
      ),
    );
  }
}
