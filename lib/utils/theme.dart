import 'package:ecommerce_app/exports.dart';

import 'package:google_fonts/google_fonts.dart';
import 'light_color.dart';

class AppTheme {
  const AppTheme();

  TextStyle _titleStyle({required FontWeight fontWeight}) {
    return GoogleFonts.mulish(fontSize: 30.sp, fontWeight: fontWeight, color: Colors.black);
  }
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromARGB(255, 245, 243, 243),
    primaryColor: LightColor.background,
    cardTheme: const CardTheme(color: LightColor.background),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: LightColor.black),
    ),
    iconTheme: const IconThemeData(color: LightColor.iconColor),
    bottomAppBarTheme:const BottomAppBarTheme(color: LightColor.background),
    dividerColor: LightColor.lightGrey,
  ).copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: LightColor.titleTextColor),
    ),
  );

  static const TextStyle titleStyle =
      TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static const TextStyle subTitleStyle =
      TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static const TextStyle h1Style =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static const TextStyle h2Style = TextStyle(fontSize: 22);
  static const TextStyle h3Style = TextStyle(fontSize: 20);
  static const TextStyle h4Style = TextStyle(fontSize: 18);
  static const TextStyle h5Style = TextStyle(fontSize: 16);
  static const TextStyle h6Style = TextStyle(fontSize: 14);

  static List<BoxShadow> shadow = [
    const BoxShadow(
      color: Color(0xFFF8F8F8),
      blurRadius: 10,
      spreadRadius: 15,
    ),
  ];

  static const EdgeInsets padding =
      EdgeInsets.symmetric(horizontal: 20, vertical: 10);
  static const EdgeInsets hPadding = EdgeInsets.symmetric(horizontal: 10);

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
