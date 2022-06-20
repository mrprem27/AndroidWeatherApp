import 'package:flutter/material.dart';
import 'package:weatherapp/screens/AddCity.dart';
import 'package:weatherapp/screens/CityList.dart';
import 'package:weatherapp/screens/weatherApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      initialRoute: '/',
      routes: {
        '/': (context) => WeatherApp(),
        '/cities': ((context) => CityList()),
        '/addCity': (context) => AddCity()
      },
    );
  }
}
