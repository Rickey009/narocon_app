import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'form_data.dart'
;
class ApiDao {
  final http.Client httpClient = http.Client();
  Future getJson(String url, FormData param, List headers) async {
    var result = await httpClient.post(url, body: json.encode(param.toJson()), headers: {headers[0]: headers[1]});
    return jsonDecode(result.body);
  }
}
