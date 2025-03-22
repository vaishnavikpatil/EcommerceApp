import 'package:ecommerce_app/model/data.dart';
import 'package:ecommerce_app/utils/light_color.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/widgets/available.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/exports.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
 const  ProductDetailPage({super.key}) ;

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInToLinear));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLiked = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColor.background,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Padding(
          padding:  EdgeInsets.all(25.w),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 35.sp,
                          width: 35.sp,
                          decoration: BoxDecoration(
                            border:Border.all(color: Colors.black12.withOpacity(0.1)) ,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child:  Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,size: 15.sp,
                          ),
                        ),
                      ),
                      Container(
                        height: 35.sp,
                        width: 35.sp,
                        decoration: BoxDecoration(
                          color: Colors.white,
                         
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child:  Icon(
                          CupertinoIcons.heart_fill,
                          color: Colors.red,size: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  _productImage(),
                  _categoryWidget()
                ],
              ),
            ),
            _detailWidget()
          ],
        ),
      ),
    );
  }




    Widget _categoryWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              AppData.showThumbnailList.map((x) => _thumbnail(x)).toList()),
    );
  }




  Widget _thumbnail(String image) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation.value,
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {}, // Define the onTap action here
          borderRadius: BorderRadius.circular(
              13), // Ensures ripple effect stays inside bounds
          child: Container(
            height: 40,
            width: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: LightColor.grey.withOpacity(0.2),
              ),
              borderRadius: const BorderRadius.all(Radius.circular(13)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                  13), // Ensure the ripple effect stays within borders
              child: Image.asset(image),
            ),
          ),
        ),
      ),
    );
  }

  Widget _icon(IconData icon,
      {Color color = LightColor.iconColor,
      double size = 20,
      double padding = 10,
      bool isOutLine = false,
      Function? onPressed}) {
    return InkWell(
      onTap: () {
        if (onPressed != null) {
          onPressed();
        }
      },
      borderRadius: const BorderRadius.all(Radius.circular(13)),
      child: Container(
        height: 40,
        width: 40,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          border: Border.all(
              color: LightColor.iconColor,
              style: isOutLine ? BorderStyle.solid : BorderStyle.none),
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          color: isOutLine
              ? Colors.transparent
              : Theme.of(context).scaffoldBackgroundColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Color(0xfff8f8f8),
                blurRadius: 5,
                spreadRadius: 10,
                offset: Offset(5, 5)),
          ],
        ),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }

  Widget _productImage() {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animation.value,
          child: child,
        );
      },
      animation: animation,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          CustomText(
            text: "AIR",
            fontSize: 160,
            color: Colors.grey.withOpacity(0.1),
          ),
          Image.asset('assets/show_1.png')
        ],
      ),
    );
  }

  Widget _detailWidget() {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    CustomText(
                      text: "NIKE AIR MAX 200",
                      fontSize: 25,
                      color: Colors.black,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:  <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                text: "\$ ",
                                fontSize: 18,
                                color: LightColor.orange,
                              ),
                              CustomText(
                                text: "240",
                                fontSize: 25,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star,
                                  color: LightColor.yellowColor, size: 17),
                              Icon(Icons.star,
                                  color: LightColor.yellowColor, size: 17),
                              Icon(Icons.star,
                                  color: LightColor.yellowColor, size: 17),
                              Icon(Icons.star,
                                  color: LightColor.yellowColor, size: 17),
                              Icon(Icons.star_border, size: 17),
                            ],
                          ),
                        ],
                      ),
                    
                  ],
                ),
                 SizedBox(height: 10.sp),
                const Available(),
                   const SizedBox(height: 20),
                 CustomText(
          text: "Description",
          fontSize: 14.sp,
        ),
                const SizedBox(height: 20),
                Text(
                  AppData.description,
                  style: GoogleFonts.mulish(color: Colors.grey,fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
