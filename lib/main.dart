import 'package:flutter/material.dart';
import 'package:flutter_training/screens/bmi_screen.dart';
import 'package:flutter_training/screens/intro_screen.dart';
import 'package:flutter_training/screens/weather_screen.dart';

void main() {
  runApp(const GlobeApp());
}

class GlobeApp extends StatelessWidget {
  const GlobeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        routes: {
          '/':(context)=>const IntroScreen(),
          '/bmi':(context)=>const BmiScreen(),
          '/weather':(context)=>const WeatherScreen()
        },
        initialRoute: '/',
        );
  }
}
