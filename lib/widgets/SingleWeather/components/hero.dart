import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSingleWeather extends StatelessWidget {
  final report;
  const HeroSingleWeather({this.report, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        (double.parse(report.temperature) - 273.15).round().toString() +
            '\u2103',
        style: GoogleFonts.lato(
            fontSize: 60, fontWeight: FontWeight.w300, color: Colors.white),
      ),
      Row(
        children: [
          Image(
              height: 40,
              image: NetworkImage('https://openweathermap.org/img/wn/' +
                  report.iconCode +
                  '.png')),
          const SizedBox(
            width: 10,
          ),
          Text(
            report.weatherType,
            style: GoogleFonts.lato(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ],
      )
    ]);
  }
}
