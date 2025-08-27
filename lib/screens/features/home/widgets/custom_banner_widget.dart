import 'package:flutter/material.dart';

import '../../../../global/images.dart';

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Image.asset(AppImage.homeBanner, fit: BoxFit.cover);
      },
    );
  }
}
