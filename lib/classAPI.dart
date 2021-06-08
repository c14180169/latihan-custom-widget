import 'package:http/http.dart' as http;
import 'dart:convert';

class DataAPI {
  double latitude;
  double longitude;

  DataAPI({required this.latitude, required this.longitude});

  void setLat(double _val) {
    this.latitude = _val;
  }

  void setLon(double _val) {
    this.longitude = _val;
  }

  factory DataAPI.fromJson(Map<String, dynamic> json) => DataAPI(
        latitude: json['lat'],
        longitude: json['lon'],
      );

  static Future<DataAPI> connectToAPI(String param) async {
    String URLApi =
        'https://api.openweathermap.org/data/2.5/weather?q=$param&appid=2ec39e41ac665f8456336aceae40fba7';
    var apiResult = await http.get(Uri.parse(URLApi));

    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['coord'];

    return DataAPI.fromJson(data);
  }
}
