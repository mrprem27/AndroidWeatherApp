import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCity extends StatefulWidget {
  const AddCity({Key? key}) : super(key: key);

  @override
  State<AddCity> createState() => _AddCityState();
}

class _AddCityState extends State<AddCity> {
  String city = '';

  addCityToCityList() async {
    if (city.length < 2) {
      print('Minimum length of city should be 2');
      return;
    }
    List<String> cityList = [];
    final prefs = await SharedPreferences.getInstance();
    try {
      cityList = prefs.getStringList('cityList') ?? [];
    } catch (e) {
      print('error - ' + e.toString());
    }
    city = city.toLowerCase();
    if (!cityList.contains(city)) {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=06d0a7fcf71b3d545247811a0c62309c'));
      if (response.statusCode == 200) {
        cityList.add(city);
      } else {
        throw Exception('Failed to load album');
      }
    } else
      print('City is Already Present');
    await prefs.setStringList('cityList', cityList);
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Container(
            // decoration: BoxDecoration(color: Color.fromARGB(255, 211, 26, 26)),
            margin: EdgeInsets.only(top: 45, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color.fromARGB(255, 60, 60, 60)),
                  // height: 35,
                  margin: EdgeInsets.only(top: 1),
                  child: TextField(
                    textCapitalization: TextCapitalization.words,
                    style: TextStyle(color: Colors.white),
                    onChanged: (value) => setState(() {
                      this.city = value;
                    }),
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(width: 0),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      hintStyle: TextStyle(color: Colors.white),
                      hintText: 'Search City name',
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (() => Navigator.pop(context)),
                  child: Center(
                      child: Text('Cancel',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                          ))),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                // for (int i = 0; i < cityList.length; i++)
                ListTile(
                  onTap: (() => addCityToCityList()),
                  contentPadding: EdgeInsets.only(left: 20),
                  textColor: Colors.white,
                  tileColor: Color.fromARGB(245, 19, 18, 18),
                  title: Text(city),
                )
              ],
            ),
          )
        ]),
        decoration: BoxDecoration(color: Colors.black),
      ),
    );
  }
}
