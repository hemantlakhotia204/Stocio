import 'package:flutter/material.dart';
import 'package:stocio_app/common/utils/common_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.color('pbg'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Login page"),
            ],
          ),
        ),
      ),
    );
  }
}
