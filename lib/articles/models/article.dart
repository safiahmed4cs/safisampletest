import 'package:jiffy/jiffy.dart';
import 'package:safisampletest/_utils/json/json_initializable.dart';

class Article extends JSONInitializable {
  late String _title;
  late String _abstractText;
  late String? _thumbnail;
  late String? _mediumImage;
  late String _updated;

  Article.fromJson(Map<String, dynamic> jsonMap) : super.fromJson(jsonMap) {
    try {
      _title = jsonMap["title"];
      _abstractText = jsonMap["abstract"];
      _updated = jsonMap["updated"];
      _thumbnail = null;
      _mediumImage = null;
      if (jsonMap["media"] != null && jsonMap["media"].length > 0) {
        if (jsonMap["media"][0]["media-metadata"].length > 0) {
          final int size = jsonMap["media"][0]["media-metadata"].length;
          _thumbnail = jsonMap["media"][0]["media-metadata"][0]["url"];
          _mediumImage = jsonMap["media"][0]["media-metadata"][size - 1]["url"];
        }
      }
    } on Exception catch (e) {
      throw Exception(
        'Failed to cast API Article response. Error message - $e',
      );
    }
  }

  String get title => _title;
  String get abstractText => _abstractText;
  String? get thumbnail => _thumbnail;
  String? get mediumImage => _mediumImage;
  String get updated => Jiffy(_updated).format("dd MMM y h:m a");
}
