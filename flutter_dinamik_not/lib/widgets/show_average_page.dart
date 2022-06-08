import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constants/app_constants.dart';

class ShowAverage extends StatelessWidget {
  final double average;
  final int subjectCount;

  const ShowAverage({required this.subjectCount, required this.average, Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(subjectCount > 0 ? "$subjectCount Subject Chosen" : "Choose subject.", style: Constants.showAverageStyle,),
        Text(average >= 0 ? "${average.toStringAsFixed(2)}" : "0.0", style: Constants.averageStyle,),
        Text("Average", style: Constants.showAverageStyle,)
      ],
    );
  }
}