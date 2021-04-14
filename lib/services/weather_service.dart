import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xtranet/models/weather.dart';





class WeatherService{
  Future<Weather> getWeather(String city) async{
    // Uri uri = "";
    final result = await http.Client().get(Uri.https(HttpHeaders.authorizationHeader,"https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=f141d46ca55c3c286d68a00b38a94856"));

    if(result.statusCode != 200)
      throw Exception();

    return parsedJson(result.body);
  }

  Weather parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return Weather.fromJson(jsonWeather);
  }
}