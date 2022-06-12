import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/model/subject.dart';

class DataHelper{
  static List<String> letterList = ["AA", "BA", "BB", "CB","CC", "DC", "DD", "FD", "FF"];
  static List<double> gradeList = [4, 3.5, 3, 2.5, 2, 1.5, 1, 0.5, 0];

  static List<Subject> allAddedSubjects = [];

  static addSubject(Subject subject){
    allAddedSubjects.add(subject);
  }

  static double calculateAverage(){
    double totalScore = 0;
    double totalCredit = 0;
    allAddedSubjects.forEach((element) {
      totalScore += element.credit * element.letter;
      totalCredit += element.credit;
    });
    return totalScore / totalCredit;
  }

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