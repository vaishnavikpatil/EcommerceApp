import 'package:ecommerce_app/exports.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          backgroundColor: Color(0xFFEF6C00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.all(15.sp),
          elevation: 0,
        ),
        onPressed: () {},
        child:  Text("Next",style: GoogleFonts.mulish(color: Colors.white,fontWeight: FontWeight.w800),),
      ),
    );
  }
}
