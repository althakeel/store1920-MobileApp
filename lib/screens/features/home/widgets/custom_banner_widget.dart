import 'package:flutter/material.dart';
import '../../../../global/images.dart';

class CustomBannerWidget extends StatelessWidget {
  final BorderRadiusGeometry borderRadius;

  const CustomBannerWidget({super.key, this.borderRadius = BorderRadius.zero});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Image.asset(AppImage.homeBanner, fit: BoxFit.cover),
        );
      },
    );
  }
}
