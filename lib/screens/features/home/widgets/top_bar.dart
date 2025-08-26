import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../../../../global/app_color.dart';
import '../../../../global/images.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final ScrollController scrollController = ScrollController();
  final RxInt currentPage = RxInt(0);
  Timer? _autoScrollTimer;
  final List<String> bannerImages = [
    AppImage.banner1,
    AppImage.banner2,
    AppImage.banner3,
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    scrollController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (mounted) {
        final nextPage = (currentPage.value + 1) % bannerImages.length;
        currentPage.value = nextPage;

        // Animate to the next page
        final double targetOffset = nextPage * (300.w + 16.w);
        scrollController.animateTo(
          targetOffset,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.dynamicColor.withValues(alpha: .8), AppColors.gradient1],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.gradient2.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
          ),
          _buildImageSlider(),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    scrollController.addListener(() {
      final double scrollPosition = scrollController.offset;
      final double bannerWidth = 300.w + 16.w;
      final int page = (scrollPosition / bannerWidth).round();
      if (page != currentPage.value &&
          page >= 0 &&
          page < bannerImages.length) {
        currentPage.value = page;
      }
    });

    return Column(
      children: [
        SizedBox(
          height: 120.h,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemCount: bannerImages.length,
            itemBuilder: (context, index) {
              return Container(
                width: 300.w,
                height: 108.h,
                padding: EdgeInsets.only(left: index == 0 ? 20.w : 0),
                margin: EdgeInsets.only(
                  right: index < bannerImages.length - 1 ? 16.w : 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                // child: ClipRRect(
                //   borderRadius: BorderRadius.circular(16),
                //   child: Image.asset(bannerImages[index], fit: BoxFit.cover),
                // ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(bannerImages.length, (index) {
            return Obx(
              () => Container(
                margin: EdgeInsets.only(right: 4.w, bottom: 10.h),
                width: 8.w,
                height: 8.h,
                decoration: BoxDecoration(
                  color: index == currentPage.value
                      ? AppColors.white
                      : AppColors.white.withValues(alpha: 0.5),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
