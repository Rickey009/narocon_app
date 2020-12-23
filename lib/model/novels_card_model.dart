import 'dart:convert';

import '../ui/novel_card.dart';
import '../http/http_model.dart';
import '../util/convert_text.dart';
import '../http/form_data.dart';

class NovelsCardModel {

  Future<List> createCardList(String argUrl) async{
    List _cardList = [];
    final _novels = await getNovelsJson(argUrl);

    NovelCard mealCard = NovelCard();
    for (var i = 0; i < _novels.length; i++) {
      _cardList.add(mealCard.createCard(_novels[i]));
    }
    return _cardList;
  }

  Future<List> getNovelsJson(String argUrl) async{
    FormData formData = FormData();
    formData.param001 = "diary";

    var jsonData = await ApiDao().getJson(argUrl, formData, ['content-type', 'application/json']);
    jsonData = jsonDecode(jsonData["body"]);
    List _novelList = [];

    for (int i = 0; i < jsonData.length; i++){
      final String _timeText = ConvertText().convertTimestamp(jsonData[i]['created_at']);

      _novelList.add(
          {
            'timeText': _timeText,
            'name': jsonData[i]['meal']['name'],
            'status': jsonData[i]['meal']['status'],
            'location': jsonData[i]['meal']['location'],
            'note':  jsonData[i]['meal']['note'],
            'imageUrlHttps': jsonData[i]['meal']['image_url'],
            'text': jsonData[i]['text'],
            'favoriteCount': jsonData[i]['favorite_count'] != 0 ? jsonData[i]['favorite_count'] : '',
            'retweetCount': jsonData[i]['retweet_count'] != 0 ? jsonData[i]['retweet_count'] : '',
            'favorite' : jsonData[i]['favorite']
          }
      );
    }
    return _novelList;
  }
}