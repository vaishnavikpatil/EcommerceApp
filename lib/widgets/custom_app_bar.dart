import 'package:ecommerce_app/exports.dart';
import 'package:ecommerce_app/widgets/custom_container.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomContainer(
          height: 35.sp,
          
          child: Icon(CupertinoIcons.bars),
        ),
        Container(
          height: 35.sp,
          width: 35.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
           
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.asset("assets/user.png", fit: BoxFit.cover),
          ),
        ),
      ],
    );
  }
}



