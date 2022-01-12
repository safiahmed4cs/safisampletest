import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safisampletest/_utils/constants/app_colors.dart';
import 'package:safisampletest/_utils/routes/routes.dart';
import 'package:safisampletest/_utils/routes/routes_names.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget with WidgetsBindingObserver {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Sample Program',
      initialRoute: RouteNames.main,
      routes: Routes().buildRoutes(context),
      theme: ThemeData(
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        primaryColor: AppColors.defaultColor,
        tabBarTheme: TabBarTheme(
          labelColor: AppColors.defaultColor,
          labelStyle: TextStyle(color: AppColors.black),
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: AppColors.defaultColor),
          ),
        ),
      ),
    );
  }
}
