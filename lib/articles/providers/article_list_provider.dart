import 'package:dio/dio.dart';
import 'package:safisampletest/articles/constants/article_urls.dart';
import 'package:safisampletest/articles/models/article.dart';

class ArticleListProvider {
  final dio = Dio();
  Future<List<Article>> getAllArticles() async {
    try {
      final String url = ArticlesUrl.getArticleUrl();
      Response response = await dio.get(url);
      return _processResponse(response);
      // return (response.data as Map<String, dynamic>).map((i) => Article.fromJson(i)).toList();
    } catch (error, stacktrace) {
      throw Exception("Exception occured: $error stackTrace: $stacktrace");
    }
  }

  Future<List<Article>> _processResponse(Response apiResponse) async {
    if (apiResponse.data == null) throw Exception();
    if (apiResponse.data["results"] == null) throw Exception();

    var responseMap = apiResponse.data["results"] as List<dynamic>;
    try {
      if (responseMap.isEmpty) return [];
      List<Article> responseArray = <Article>[];
      for (var item in responseMap) {
        if (item is! Map<String, dynamic>) throw Exception();
        responseArray.add(Article.fromJson(item));
      }
      return responseArray;
    } catch (e) {
      throw Exception();
    }
  }
}
