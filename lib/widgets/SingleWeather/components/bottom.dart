import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/SingleWeather/components/repeat/measure.dart';

class BottomSingleWeather extends StatelessWidget {
  final report;
  const BottomSingleWeather({this.report, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        MeasureSingleWeather(
            type: 'Wind',
            value: report.wind,
            maxValue: 50,
            unit: 'Km/hr'),
        MeasureSingleWeather(
            type: 'Rain',
            value: report.rain,
            maxValue: 100,
            unit: '%'),
        MeasureSingleWeather(
            type: 'Humidity',
            value: report.humidity,
            maxValue: 100,
            unit: '%'),
      ]),
    );
  }
}
