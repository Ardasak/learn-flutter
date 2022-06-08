import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/widgets/calculate_average_page.dart';

import 'constants/app_constants.dart';

void main(){
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dynamic Average Calculation",
      home: CalculateAveragePage(),
      theme: ThemeData(primarySwatch: Constants.primaryColor, visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }

}