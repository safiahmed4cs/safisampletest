// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:safisampletest/_utils/constants/app_colors.dart';
import 'package:safisampletest/_utils/routes/routes_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHomeScreen();
    super.initState();
  }

  _navigateToHomeScreen() async {
    var _ = await Future.delayed(const Duration(milliseconds: 3000));

    Navigator.pushNamedAndRemoveUntil(
        context, RouteNames.articleListScreen, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Text(
          "NY Times",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
