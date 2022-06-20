import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp/widgets/functions/functions.dart';
import 'package:intl/intl.dart';

class TopSingleWeather extends StatelessWidget {
  final report;
  final city;
  const TopSingleWeather({
    this.report,
    this.city,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 110,
      ),
      Text(
        capitalize(city),
        style: GoogleFonts.lato(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      const SizedBox(
        height: 3.5,
      ),
      Text(
        DateFormat('hh:mm a - EEEE, dd MMM yyyy').format(
            DateTime.fromMillisecondsSinceEpoch(
                int.parse(report.dateTime) * 1000)),
        style: GoogleFonts.lato(
            fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ]);
  }
}
