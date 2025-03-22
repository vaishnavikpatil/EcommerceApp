import 'package:ecommerce_app/exports.dart';
import 'package:ecommerce_app/screens/home.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/services.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Ecommerce',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}
