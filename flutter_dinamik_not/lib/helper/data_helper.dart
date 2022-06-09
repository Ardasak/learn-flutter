import 'package:flutter/material.dart';

class DataHelper{
  static List<String> letterList = ["AA", "BA", "BB", "CB","CC", "DC", "DD", "FD", "FF"];
  static List<double> gradeList = [4, 3.5, 3, 2.5, 2, 1.5, 1, 0.5, 0];

  static List<DropdownMenuItem<double>> returnList(){
    return letterList
            .map((e) => DropdownMenuItem<double>(
                  child: Text(e),
                  value: gradeList[letterList.indexOf(e)],
                ))
            .toList();
  }

  static List<int> allCredits = List.generate(10, (index) => index + 1);

  static List<DropdownMenuItem<int>> allCreditItems = List.generate(allCredits.length, (index) => DropdownMenuItem(child: Text(allCredits[index].toString()), value: allCredits[index],));
}