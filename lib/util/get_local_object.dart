import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class LoadLocalJson {
  /// LocalのJsonファイルを読み込む
  /// 
  /// [path]のファイルを読み込み、JsonDecodeした[res]を返却する。
  Future getJson(String path) async {
    var res = await rootBundle.loadString(path);
    return jsonDecode(res);
  }
}