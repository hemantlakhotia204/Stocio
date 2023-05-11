import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:stocio_app/auth/screens/login_screen.dart';
import 'package:stocio_app/auth/screens/register_screen.dart';
import 'package:stocio_app/common/utils/common_utils.dart';
import 'package:stocio_app/home/screens/home_screen.dart';
import 'package:stocio_app/profile/profile_screen.dart';
import 'package:stocio_app/splash_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

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
            navigatorKey: navigatorKey,
            title: 'Stocio',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Utils.color('sbg')),
              textTheme: Theme.of(context).textTheme.apply(
                    displayColor: Utils.color('pt'),
                    bodyColor: Utils.color('pt'),
                    fontFamily: 'Signika',
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
              "/register": (context) => const RegisterScreen(),
              "/home": (context) => const HomeScreen(),
              "/profile": (context) => const ProfileScreen(),
            },
          ),
        );
      },
    );
  }
}
