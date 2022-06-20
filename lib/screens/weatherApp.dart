// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weatherapp/models/city_weather.dart';
import 'package:weatherapp/widgets/SingleWeather/SingleWeather.dart';
import 'package:weatherapp/widgets/Dot%20Slider/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  String bgImg = '';
  bool rotate = false;
  List<String> cityList = [];
  var report = null;

  Future<String> getCityList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        this.cityList = prefs.getStringList('cityList') ?? [];
        if (cityList.length > 0)
          fetchWeather(cityList[_currentPage].toLowerCase());
      });
      return 'Success';
    } catch (e) {
      print('error:' + e.toString());
    }
    return 'Failure';
  }

  void fetchWeather(city) async {
    setState(() {
      rotate = true;
    });
    final response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=06d0a7fcf71b3d545247811a0c62309c'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data['name']);
      final report = WeatherLocation(
          city: data['name'],
          dateTime: data['dt'].toString(),
          temperature: data['main']['temp'].toString(),
          iconCode: data['weather'][0]['icon'].toString(),
          weatherType: data['weather'][0]['main'],
          wind: data['wind']['speed'].toInt(),
          rain: Random().nextInt(100),
          humidity: data['main']['humidity'].toInt());
      setState(() {
        this.report = report;
        this.rotate = false;
      });
    } else {
      setState(() {
        rotate = false;
        ;
      });
      throw Exception('Failed to load album');
    }
  }

  void initState() {
    super.initState();
    this.getCityList();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      if (cityList.length > 0) fetchWeather(cityList[index].toLowerCase());
    });
  }

  @override
  Widget build(BuildContext context) {
    if (report == null) {
      bgImg = 'assets/night.jpg';
    } else
      bgImg = 'assets/' + report.weatherType.toLowerCase() + '.jpg';

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Weather App'),
        elevation: 0,
        leading: AnimatedContainer(
          duration: Duration(seconds: 1),
          child: AnimatedRotation(
            turns: rotate ? 50 : 0,
            duration: rotate
                ? const Duration(seconds: 30)
                : const Duration(seconds: 0),
            child: IconButton(
                onPressed: () {
                  _onPageChanged(_currentPage);
                },
                icon: const Icon(
                  Icons.refresh,
                  size: 30,
                  color: Colors.white,
                )),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/cities')
                  .then((value) => this.getCityList()),
              child: SvgPicture.asset(
                'assets/menu.svg',
                height: 30,
                width: 30,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              bgImg,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Container(
              decoration: const BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: const EdgeInsets.only(top: 115, left: 15),
              child: Row(children: [
                for (int i = 0; i < cityList.length; i++)
                  SliderDot(i == _currentPage)
              ]),
            ),
            report != null
                ? PageView.builder(
                    onPageChanged: _onPageChanged,
                    scrollDirection: Axis.horizontal,
                    itemCount: cityList.length,
                    itemBuilder: (ctx, i) =>
                        SingleWeather(i, report, cityList[i]))
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
