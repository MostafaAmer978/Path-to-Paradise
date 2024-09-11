import 'dart:convert';

import 'package:http/http.dart' as http;

import 'radios_response.dart';

class ApiManager {
  /// GetRadios
  static Future<RadiosResponse> getRadios() async {
    Uri url = Uri.https("mp3quran.net", "/api/v3/radios");
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return RadiosResponse.fromJson(json);
    } else {
      return throw Exception("Something went Wrong");
    }
  }
}
