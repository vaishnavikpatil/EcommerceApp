import 'package:ecommerce_app/exports.dart';
import 'package:ecommerce_app/model/category.dart';
import 'package:ecommerce_app/model/data.dart';
import 'package:ecommerce_app/screens/product_details.dart';
import 'package:ecommerce_app/utils/light_color.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/widgets/custom_container.dart';
import 'package:ecommerce_app/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
              Text("Our", style: _titleStyle(fontWeight: FontWeight.w300)),
              Text("Products", style: _titleStyle(fontWeight: FontWeight.w600)),
              SizedBox(height: 20.h),
              searchField(),
              SizedBox(height: 10.h),
              categoryWidget(),
              SizedBox(height: 35.h),
              productWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget categoryWidget() {
    return SizedBox(
      width: AppTheme.fullWidth(context),
      height: 75.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppData.categoryList.length,
        itemBuilder: (context, index) {
          final category = AppData.categoryList[index];
          return ProductIcon(
            model: category,
            onSelected: (model) {
              setState(() {
                for (var item in AppData.categoryList) {
                  item.isSelected = false;
                }
                model.isSelected = true;
              });
            },
          );
        },
      ),
    );
  }

  Widget searchField() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45.h,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: LightColor.lightGrey.withAlpha(100),
              borderRadius: BorderRadius.all(Radius.circular(12.r)),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search Products",
                hintStyle: GoogleFonts.mulish(fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.w400),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                prefixIcon: Icon(Icons.search, color: Colors.black54, size: 20.w),
              ),
            ),
          ),
        ),
        SizedBox(width: 20.w),
        CustomContainer(height: 45.h, child: Icon(CupertinoIcons.slider_horizontal_3
, size: 22.w)),
      ],
    );
  }

  Widget productWidget() {
    return SizedBox(
      height: AppTheme.fullWidth(context) * .75,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppData.productList.length,
        itemBuilder: (context, index) => ProductCard(
          product: AppData.productList[index],
          onSelected: (model) {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage()));
            });
          },
        ),
      ),
    );
  }

  TextStyle _titleStyle({required FontWeight fontWeight}) {
    return GoogleFonts.mulish(fontSize: 28.sp, fontWeight: fontWeight, color: Colors.black);
  }
}

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category> onSelected;
  final Category model;

  const ProductIcon({super.key, required this.model, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return model.id == null
        ? const SizedBox()
        : Padding(
          padding: EdgeInsets.only(right: 10.sp),
          child: GestureDetector(
              onTap: () => onSelected(model),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15.h),
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: model.isSelected ? Colors.white : LightColor.background,
                  border: Border.all(
                    color: model.isSelected ? LightColor.orange : LightColor.lightGrey,
                    width: model.isSelected ? 2.w : 1.w,
                  ),
                ),
                child: Row(
                  children: [
                    if (model.image != null) Image.asset(model.image!, width: 40.sp, height: 40.sp),
                    if (model.name != null)
                      Padding(
                        padding: EdgeInsets.only(left: 2.sp),
                        child: Text(
                          model.name!,
                          style: GoogleFonts.mulish(fontWeight: FontWeight.w700, fontSize: 15.sp, color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ),
        );
  }
}
