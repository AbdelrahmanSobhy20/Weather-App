import 'dart:convert';

import 'package:weather_project/api/models/weather_api_response.dart';
import 'package:http/http.dart' as http;
class WeatherAPI{
  Future<WeatherApiResponse> getAPIData()async{
    final http.Response response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=f27d7c7a9ec2fd9599836336391d129c"));
    if(response.statusCode <=299 && response.statusCode >= 200) {
      final Map<String, dynamic>jsonBody = jsonDecode(response.body);
      WeatherApiResponse weatherApiResponse = WeatherApiResponse.fromMap(
          jsonBody);
      return weatherApiResponse;
    }else{
      throw("RequestFailure" + response.body);
    }

  }
}