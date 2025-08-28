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
  Timer? _flipTimer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _flipTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!mounted) return;
      setState(() {
        _currentIndex = (_currentIndex + 1) % 2;
      });
    });
  }

  @override
  void dispose() {
    _flipTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double iconHeight = 30.h;
    final double verticalPadding = 14.h;
    final double titleHeight = 16.sp * 1.2;
    final double subtitleHeight = 12.sp * 1.2;
    final double contentHeight = math.max(
      iconHeight,
      titleHeight + subtitleHeight,
    );
    final double cardHeight = (contentHeight + (verticalPadding * 2) + 4.h)
        .clamp(56.h, 120.h);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.32),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.sp),
          bottom: Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(color: AppColors.dynamicColor.withValues(alpha: 0.1)),
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
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 800),
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                transitionBuilder: (child, animation) {
                  final bool isNew = (child.key as ValueKey<int>).value == _currentIndex;
                  final Animation<Offset> offset = isNew
                      ? Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                          .animate(animation)
                      : Tween<Offset>(begin: Offset.zero, end: const Offset(0, 0))
                          .animate(animation);
                  return ClipRect(
                    child: SlideTransition(position: offset, child: child),
                  );
                },
                child: SizedBox(
                  key: ValueKey<int>(_currentIndex),
                  height: cardHeight,
                  child: _buildRightCard(_currentIndex),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightCard(int index) {
    if (index == 0) {
      return _buildFeatureCard(
        icon: Icons.refresh,
        title: 'Free Delivery',
        subtitle: 'Within 7 days',
        isDecoration: true,
        bgColor: Colors.green,
      );
    }
    return _buildFeatureCard(
      icon: Icons.lock_outline,
      title: 'Secure Checkout',
      subtitle: '100% protected',
      isDecoration: true,
      bgColor: Colors.orange,
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool isDecoration = false,
    Color bgColor = Colors.transparent,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      margin: EdgeInsets.zero,
      decoration: isDecoration
          ? BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(20.r),
            )
          : BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: isDecoration
                ? null
                : BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
            child: Icon(icon, color: AppColors.black, size: 18.sp),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDecoration
                        ? AppColors.white
                        : Colors.green.withValues(green: .5),
                    fontSize: 16.sp,
                    letterSpacing: 0.6,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: isDecoration
                        ? AppColors.white
                        : Colors.black.withValues(alpha: 0.9),
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
