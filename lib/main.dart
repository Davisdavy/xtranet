import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xtranet/bloc/bloc_weather.dart';
import 'package:xtranet/services/repository.dart';
import 'package:xtranet/pages/search_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,

          body: BlocProvider(
            create: (context) => BlocWeather(WeatherRepo()),
            child: Container(
              decoration:BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/cloudy.jpeg"), fit: BoxFit.cover)),
                child: SearchPage()),
          ),
        )
    );
  }
}










