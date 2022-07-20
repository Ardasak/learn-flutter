import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/car.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({Key? key}) : super(key: key);

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    carsJsonRead(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json"),
        centerTitle: true,
      ),
      body: Center(),
    );
  }

  carsJsonRead(BuildContext context) async {
    String readString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/cars.json");
    // debugPrint(readString);
    // debugPrint("************************");

    /*List<Car> carList = jsonDecode(readString);
    debugPrint(carList[1]["model"][0]["model_name"].toString());*/

    var jsonObject = jsonDecode(readString);

    // debugPrint((jsonObject as List).toString());
    // debugPrint(readString);

    List<Car> allCars = (jsonObject as List).map((e) {
      debugPrint(e.toString());
      return Car.fromMap(e);
    }).toList();
    debugPrint(allCars[0].country);
    debugPrint(allCars.length.toString());
  }
}
