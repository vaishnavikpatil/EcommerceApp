import 'package:ecommerce_app/exports.dart';
import 'package:ecommerce_app/utils/light_color.dart';
import 'package:ecommerce_app/widgets/custom_text.dart';

class Available extends StatefulWidget {
  const Available({super.key});

  @override
  State<Available> createState() => _AvailableState();
}

class _AvailableState extends State<Available> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
          text: "Available Sizes",
          fontSize: 14.sp,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(7.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
                child: const CustomText(
                  text: "US 6",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 20.sp,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(7.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
                child: const CustomText(
                  text: "US 7",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 20.sp,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(7.r)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
                child: const CustomText(
                  text: "US 8",
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        CustomText(
          text: "Color",
          fontSize: 14.sp,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(LightColor.yellowColor, isSelected: true),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.lightBlue),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.black),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.red),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.skyBlue),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12.r,
      backgroundColor: color.withAlpha(50),
      child: CircleAvatar(radius: 8.r, backgroundColor: color),
    );
  }
}
