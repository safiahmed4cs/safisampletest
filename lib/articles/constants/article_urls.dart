import 'package:safisampletest/_shared/app_url.dart';

class ArticlesUrl {
  static String getArticleUrl() {
    return '${AppUrl.baseURL}/all-sections/7.json?api-key=${AppUrl.apikey}';
  }
}
