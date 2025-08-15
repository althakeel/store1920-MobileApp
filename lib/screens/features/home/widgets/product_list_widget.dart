import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store1920/screens/features/home/widgets/product_widget.dart';

import '../../../../global/images.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productImages = [
      AppImage.prod1,
      AppImage.prod2,
      AppImage.prod3,
      AppImage.prod4,
    ];

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ProductWidget(
                imageUrl: productImages[0],
                title: 'Watches Mens 2022 LIGE Top Brand',
                originalPrice: '59.00',
                currentPrice: '45.00',
                discount: '-24% OFF',
                sold: '0',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ProductWidget(
                imageUrl: productImages[1],
                title: 'Watches Mens 2022 LIGE Top Brand',
                originalPrice: '59.00',
                currentPrice: '45.00',
                discount: '-24% OFF',
                sold: '0',
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: ProductWidget(
                imageUrl: productImages[2],
                title: 'Nike Run Defy mens LACED SHOES',
                originalPrice: '59.00',
                currentPrice: '38.00',
                discount: '-36% OFF',
                sold: '0',
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ProductWidget(
                imageUrl: productImages[3],
                title: 'Premium Leather Handbag',
                originalPrice: '89.00',
                currentPrice: '67.00',
                discount: '-25% OFF',
                sold: '0',
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
