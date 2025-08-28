import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store1920/global/constant_styles.dart';
import '../../../../global/app_color.dart';
import '../../../../routes/app_routes.dart';

class CategoryGridItem extends StatelessWidget {
  final Map<String, dynamic> category;
  final VoidCallback onTap;

  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // final isSelected = category['isSelected'] ?? false;
    // final hasBadge = category['hasBadge'] ?? false;
    // final badgeIcon = category['badgeIcon'];
    // final color = category['color'] ?? AppColors.dynamicColor;

    return GestureDetector(
      onTap: () {
        onTap();
        Get.toNamed(AppRoutes.productList);
      },
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.05),
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double inset = 12.w;
                    final double factor =
                        ((constraints.maxWidth - inset * 2) / constraints.maxWidth)
                            .clamp(0.8, 0.92);
                    return FractionallySizedBox(
                      widthFactor: factor,
                      heightFactor: factor,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Image.asset(
                          category['icon'],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Text(
            category['name'] as String,
            style: bodyStyle.copyWith(color: AppColors.black),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
