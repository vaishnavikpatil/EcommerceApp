import 'package:ecommerce_app/exports.dart';

class CustomContainer extends StatelessWidget {
  double height;
  Widget child;
   CustomContainer({required this.height,required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: height,
          width: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: child,);
  }
}