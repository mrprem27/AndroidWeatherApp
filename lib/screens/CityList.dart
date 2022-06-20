// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityList extends StatefulWidget {
  const CityList({Key? key}) : super(key: key);

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  List<String> cityList = [];
  @override
  void initState() {
    super.initState();
    this.getCityList();
  }

  Future<String> getCityList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        this.cityList = prefs.getStringList('cityList') ?? [];
      });
      return 'Success';
    } catch (e) {
      print('error:' + e.toString());
    }
    return 'Failure';
  }

  deleteCity(city) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> cL = [];
    try {
      cL = prefs.getStringList('cityList') ?? [];
    } catch (e) {
      print('error - ' + e.toString());
    }
    cL = cL.where((c) => c != city).toList();
    await prefs.setStringList('cityList', cL);
    setState(() {
      this.cityList = cL;
    });
    // print('City Deleted');
    // print(city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('City Management'),
        elevation: .3,
        shadowColor: Color.fromARGB(176, 255, 255, 255),
        actions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/addCity')
                  .then((value) => getCityList()),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: ListView(
          children: [
            ListTile(
              textColor: Colors.white,
              tileColor: Color.fromARGB(245, 19, 18, 18),
              title: Text('Auto Location City Name  - City Name'),
            ),
            for (int i = 0; i < cityList.length; i++)
              ListTile(
                textColor: Colors.white,
                tileColor: Color.fromARGB(245, 19, 18, 18),
                trailing: IconButton(
                  onPressed: (() => deleteCity(cityList[i])),
                  icon: Icon(Icons.delete_outline_rounded),
                  color: Color.fromARGB(203, 255, 255, 255),
                ),
                title: Text(cityList[i].toUpperCase()),
              ),
          ],
        ),
      ),
    );
  }
}
