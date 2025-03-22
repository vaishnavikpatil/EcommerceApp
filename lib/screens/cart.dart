import 'package:ecommerce_app/exports.dart';
import 'package:ecommerce_app/model/data.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/utils/light_color.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/widgets/custom_button.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: LightColor.background,
        body: Padding(
            padding: EdgeInsets.all(25.w),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: 30.h),
                  const CustomAppBar(),
                  SizedBox(height: 30.h),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Shopping",
                              style: _titleStyle(fontWeight: FontWeight.w300)),
                          Text("Cart",
                              style: _titleStyle(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.delete,color: LightColor.orange,))
                    ],
                  ),
                  SizedBox(height: 20.h),
                  cartItems(),
                  SizedBox(height: 30.sp),
                  Divider(
                    color: Colors.black.withOpacity(0.1),
                    thickness: 1,
                  ),
                  price(),
                  SizedBox(height: 40.sp),
                  const CustomButton()
                ]))));
  }

  Widget cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.sp),
      child: SizedBox(
        height: 80.sp,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.2,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      height: 55.sp,
                      width: 55.sp,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: LightColor.lightGrey,
                                  borderRadius: BorderRadius.circular(10.r)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: -20,
                    bottom: -15,
                    child: Image.asset(model.image!),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 15.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: model.name!,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 4.sp),
                        Row(
                          children: <Widget>[
                            CustomText(
                              text: '\$ ',
                              color: LightColor.orange,
                              fontSize: 12,
                            ),
                            CustomText(
                              text: model.price.toString(),
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: LightColor.lightGrey.withAlpha(150),
                            borderRadius: BorderRadius.circular(10)),
                        child: CustomText(
                          text: 'x${model.id}',
                          fontSize: 12,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price! * x.id!;
    });
    return price;
  }

  Widget price() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomText(
          text: '${AppData.cartList.length} Items',
          color: LightColor.grey,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        CustomText(
          text: '\$${getPrice()}',
          fontSize: 18,
        ),
      ],
    );
  }

  TextStyle _titleStyle({required FontWeight fontWeight}) {
    return GoogleFonts.mulish(
        fontSize: 28.sp, fontWeight: fontWeight, color: Colors.black);
  }
}
