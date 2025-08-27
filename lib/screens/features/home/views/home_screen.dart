import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/images.dart';
import 'package:store1920/screens/features/home/widgets/custom_banner_widget.dart';
import '../../../../global/app_color.dart';
import '../controllers/home_controller.dart';
import '../widgets/icon_list_of_categories.dart';
import '../widgets/product_tabs_list.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/feature_cards.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [_buildSliverAppBar(context), _buildSliverContent()],
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changeIndex,
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final double topBarHeight = 80.h;
    final double horizontalPadding = 16.w;
    const double bannerAspectRatio = 1400.0 / 5000.0;
    final double bannerExpandedHeight =
        (Get.width - (horizontalPadding * 2)) * bannerAspectRatio;
    final double minHeight = statusBarHeight + topBarHeight;
    final double maxHeight = minHeight + bannerExpandedHeight;
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        topBarHeight: topBarHeight,
        minHeight: minHeight,
        maxHeight: maxHeight,
        topBar: _buildTopBar(),
        banner: CustomBannerWidget(),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 8.h),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'winter blanket',
                  hintStyle: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: 14.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 2.h,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.textGrey,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.dynamicColor,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverContent() {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
              child: Column(
                spacing: 16.h,
                children: [
                  const FeatureCards(),
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
    );
  }

  Widget _buildAdvertisementBanner() {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Image.asset(
          AppImage.homeBanner,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double topBarHeight;
  final double minHeight;
  final double maxHeight;
  final Widget topBar;
  final Widget banner;

  _SliverAppBarDelegate({
    required this.topBarHeight,
    required this.minHeight,
    required this.maxHeight,
    required this.topBar,
    required this.banner,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final progress = shrinkOffset / (maxHeight - minHeight);
    final backgroundColor = Color.lerp(
      AppColors.dynamicColor,
      AppColors.white,
      progress.clamp(0.0, 1.0),
    );

    final remainingForBanner = (maxExtent - shrinkOffset) - minExtent;
    final bannerHeight = remainingForBanner > 0 ? remainingForBanner : 0.0;

    return ClipRect(
      child: Container(
        color: backgroundColor,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: topBarHeight, child: topBar),
              if (bannerHeight > 0)
                SizedBox(height: bannerHeight, child: banner),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        topBarHeight != oldDelegate.topBarHeight ||
        topBar != oldDelegate.topBar ||
        banner != oldDelegate.banner;
  }
}
