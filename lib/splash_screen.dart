import 'package:flutter/material.dart';
import 'package:stocio_app/common/store/shared_preference_repo.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadNextScreen();
  }

  _loadNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 1200));
    String route = '/login';
    String? at = await SharedPrefRepo.get("at");
    if (at != null && at.isNotEmpty) {
      route = "/home";
    }

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.color('pbg'),
    );
  }
}
