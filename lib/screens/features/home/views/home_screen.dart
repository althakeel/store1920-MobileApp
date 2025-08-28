import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';
import 'package:store1920/global/static_data.dart';
import 'package:store1920/screens/features/home/widgets/custom_banner_widget.dart';
import 'package:store1920/screens/features/home/widgets/deal_product_card.dart';
import '../../../../global/app_color.dart';
import '../controllers/home_controller.dart';
import '../widgets/icon_list_of_categories.dart';
import '../widgets/product_tabs_list.dart';
import '../widgets/product_list_widget.dart';
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
                  CustomBannerWidget(borderRadius: BorderRadius.circular(12.r)),
                  const _MegaDealsSection(),
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
}

class _MegaDealsSection extends StatelessWidget {
  const _MegaDealsSection();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> deals = StaticData.dealsProd;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.gradient1.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'MEGA DEALS',
                style: titleStyle.copyWith(
                  letterSpacing: 0.6,
                  color: AppColors.dynamicColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withValues(alpha: 0.08),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.hourglass_bottom,
                      size: 14.sp,
                      color: AppColors.dynamicColor,
                    ),
                    SizedBox(width: 6.w),
                    Obx(
                      () => Text(
                        HomeController.instance.dealsCountdownText.value,
                        style: bodyStyle.copyWith(
                          color: AppColors.dynamicColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.72,
            ),
            itemBuilder: (_, i) {
              final item = deals[i];
              return DealProductCard(
                imagePath: item['img'] as String,
                price: item['price'] as double,
                title: item['title'] as String,
              );
            },
          ),
        ],
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

    final double bannerMaxHeight = maxExtent - minExtent;
    final double remainingForBanner = (maxExtent - shrinkOffset) - minExtent;
    final double visibleBannerHeight = remainingForBanner.clamp(0.0, bannerMaxHeight);

    return ClipRect(
      child: Container(
        color: backgroundColor,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: topBarHeight, child: topBar),
              if (visibleBannerHeight > 0)
                SizedBox(
                  height: visibleBannerHeight,
                  child: ClipRect(
                    child: OverflowBox(
                      alignment: Alignment.topCenter,
                      minHeight: bannerMaxHeight,
                      maxHeight: bannerMaxHeight,
                      child: SizedBox(
                        height: bannerMaxHeight,
                        child: banner,
                      ),
                    ),
                  ),
                ),
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
