import 'package:flutter/material.dart';
import 'package:safisampletest/_utils/routes/routes_names.dart';
import 'package:safisampletest/articles/ui/article_list_screen.dart';
import 'package:safisampletest/splash_screen.dart';

class Routes {
  Map<String, WidgetBuilder> buildRoutes(BuildContext context) {
    return <String, WidgetBuilder>{
      //MARK: General Routes
      RouteNames.main: (context) => const SplashScreen(),

      //MARK: Article Routes
      RouteNames.articleListScreen: (context) => const ArticleListScreen(),
    };
  }
}
