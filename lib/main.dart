import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/auth/screens/login_screen.dart';
import 'package:stocio_app/home/screens/home_screen.dart';
import 'package:stocio_app/splash_screen.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return OverlaySupport.global(
          child: MaterialApp(
            title: 'Stocio',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Utils.color('sbg')),
              textTheme: Theme.of(context).textTheme.apply(
                displayColor: Utils.color('pt'),
                bodyColor: Utils.color('pt'),
              ),
              iconTheme: IconThemeData(
                color: Utils.color('pb'),
                size: 22.sp,
              ),
              useMaterial3: true,
            ),
            initialRoute: "/",
            routes: {
              "/": (context) => const SafeArea(child: SplashScreen()),
              "/login": (context) => const LoginScreen(),
              "/home": (context) => const HomeScreen(),
            },
          ),
        );
      },
    );
  }
}
