import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeasureSingleWeather extends StatelessWidget {
  final value, maxValue, type, unit;
  const MeasureSingleWeather(
      {this.type, this.value, this.maxValue, this.unit, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          type,
          style: GoogleFonts.lato(
              fontSize: 12.5, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          value.toString(),
          style: GoogleFonts.lato(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Text(
          unit,
          style: GoogleFonts.lato(
              fontSize: 12.5, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(15)),
              height: 4,
              width: 50,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(15)),
              height: 3.8,
              width: (value / maxValue) * 50,
            ),
          ],
        )
      ],
    );
  }
}
