import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:xtranet/model/weather.dart';

class WeatherRepo{
  Future<Weather> getWeather(String city) async{
    //APIKEYto be hidden in the future
    final result = await http.Client().get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&APPID=f141d46ca55c3c286d68a00b38a94856"));
    //Check connect state
    if(result.statusCode != 200)
      throw Exception();
    else
    return parsedJson(result.body);
  }
  
  Weather parsedJson(final response){
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded["main"];

    return Weather.fromJson(jsonWeather);
  }
}
