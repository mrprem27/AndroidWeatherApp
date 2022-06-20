import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/SingleWeather/components/bottom.dart';
import 'package:weatherapp/widgets/SingleWeather/components/hero.dart';
import 'package:weatherapp/widgets/SingleWeather/components/top.dart';
import 'package:weatherapp/widgets/globalWidgests/globalWidgests.dart';

class SingleWeather extends StatelessWidget {
  final int index;
  final report;
  final city;

  // ignore: use_key_in_widget_constructors
  const SingleWeather(this.index, this.report, this.city);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopSingleWeather(report: report, city: city),
                      HeroSingleWeather(report: report)
                    ]),
              ),
              Column(
                children: [hrLine(20), BottomSingleWeather(report: report)],
              )
            ]));
  }
}
