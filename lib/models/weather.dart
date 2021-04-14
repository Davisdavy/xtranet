import 'package:flutter/material.dart';
class Weather{
   final temp;
  final pressure;
  final  humidity;
  final wind;
  final  rain;

  Weather({this.temp, this.pressure, this.humidity, this.wind,this.rain});

   factory Weather.fromJson(Map<String, dynamic> json) => Weather(
     temp: json["temp"],
     pressure: json["pressure"],
     humidity: json["humidity"],
     wind: json["wind"],
     rain: json["rain"],
   );

}

