import 'package:http/http.dart' as http;
import 'dart:convert';

class DataTemp {
  double temperature;
  double pressure;
  double humidity;

  DataTemp(
      {required this.temperature,
      required this.pressure,
      required this.humidity});

  factory DataTemp.fromJson(Map<String, dynamic> json) => DataTemp(
        temperature: json['temp'],
        pressure: json['pressure'],
        humidity: json['humidity'],
      );

  static Future<DataTemp> connectToAPI(String param) async {
    print(param);
    String URLApi =
        'https://api.openweathermap.org/data/2.5/weather?q=$param&appid=2ec39e41ac665f8456336aceae40fba7';
    var apiResult = await http.get(Uri.parse(URLApi));

    var jsonObject = json.decode(apiResult.body);
    var data = (jsonObject as Map<String, dynamic>)['main'];

    return DataTemp.fromJson(data);
  }
}
