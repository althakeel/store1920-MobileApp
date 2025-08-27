import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/global/app_color.dart';

class FeatureCards extends StatefulWidget {
  const FeatureCards({super.key});

  @override
  State<FeatureCards> createState() => _FeatureCardsState();
}

class _FeatureCardsState extends State<FeatureCards> {
  late final PageController _pageController;
  Timer? _flipTimer;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _flipTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      _pageIndex = (_pageIndex + 1) % 2;
      if (!mounted) return;
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _flipTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double iconHeight = 30.h;
    final double verticalPadding = 22.h; // from _buildFeatureCard
    final double titleHeight = 16.sp * 1.2;
    final double subtitleHeight = 12.sp * 1.2;
    final double contentHeight = math.max(iconHeight, titleHeight + subtitleHeight);
    final double cardHeight = (contentHeight + (verticalPadding * 2) + 4.h)
        .clamp(56.h, 120.h);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.32),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.sp),
          bottom: Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.dynamicColor.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildFeatureCard(
              icon: Icons.local_shipping,
              title: 'Free Shipping',
              subtitle: 'On unlimited orders',
            ),
          ),
          SizedBox(
            height: (cardHeight - 24.h).clamp(24.h, cardHeight),
            width: 16.w,
            child: CustomPaint(
              painter: _TaperedVerticalDividerPainter(
                color: AppColors.black.withValues(alpha: 0.2),
                halfBaseWidth: .8.sp,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: cardHeight,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                children: [
                  _buildFeatureCard(
                    icon: Icons.refresh,
                    title: 'Free Delivery',
                    subtitle: 'Within 7 days',
                  ),
                  _buildFeatureCard(
                    icon: Icons.lock_outline,
                    title: 'Secure Checkout',
                    subtitle: '100% protected',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 22.h),
      child: Row(
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Icon(icon, color: AppColors.black, size: 18.sp),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.green.withValues(green: .5),
                    fontSize: 16.sp,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.black.withValues(alpha: 0.9),
                    fontSize: 12.sp,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TaperedVerticalDividerPainter extends CustomPainter {
  final Color color;
  final double halfBaseWidth;

  _TaperedVerticalDividerPainter({
    required this.color,
    required this.halfBaseWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    final double centerX = size.width / 2;
    final double topY = 0;
    final double bottomY = size.height;

    path.moveTo(centerX, topY); // pointy top
    path.lineTo(centerX + halfBaseWidth, size.height * 0.2);
    path.lineTo(centerX + halfBaseWidth, size.height * 0.8);
    path.lineTo(centerX, bottomY); // pointy bottom
    path.lineTo(centerX - halfBaseWidth, size.height * 0.8);
    path.lineTo(centerX - halfBaseWidth, size.height * 0.2);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _TaperedVerticalDividerPainter oldDelegate) {
    return color != oldDelegate.color ||
        halfBaseWidth != oldDelegate.halfBaseWidth;
  }
}
