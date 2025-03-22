import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/light_color.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final ValueChanged<Product> onSelected;

  const ProductCard({super.key, required this.product, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.w),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(color: const Color(0xfff8f8f8), blurRadius: 15.r, spreadRadius: 10.r),
          ],
        ),
        child: InkWell(
          onTap: () => onSelected(product),
          borderRadius: BorderRadius.circular(20.r),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 15.sp,vertical: 20.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
       crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(alignment: Alignment.topLeft,
                  child: Icon(
                     Icons.favorite_border,
                    color: Colors.black26,
                    size: 22.sp,
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 45.r,
                      backgroundColor: LightColor.orange.withAlpha(40),
                    ),
                    Image.asset(product.image!, width: 150.sp, height: 150.sp, fit: BoxFit.cover),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.sp),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                              CustomText(text: product.name!, fontSize: 14.sp, fontWeight: FontWeight.w800),
                                  CustomText(text: product.category!, fontSize: 12.sp, color: LightColor.orange),
                                  CustomText(text: "\$${product.price}", fontSize: 18.sp, fontWeight: FontWeight.w800),
                              
                    ],
                  ),
                )
                  ],
            ),
          ),
        ),
      ),
    );
  }
}
