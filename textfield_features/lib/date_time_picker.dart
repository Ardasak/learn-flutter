import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';  

class DateTimeExample extends StatefulWidget {
  DateTimeExample({Key? key}) : super(key: key);

  @override
  State<DateTimeExample> createState() => _DateTimeExampleState();
}

class _DateTimeExampleState extends State<DateTimeExample> {
  @override
  Widget build(BuildContext context) {
    DateTime current = DateTime.now();
    DateTime kirkYilOnce = DateTime(current.year - 40, current.month, current.day, current.hour, current.minute, current.second, current.millisecond, current.microsecond);

    TimeOfDay currentTime = TimeOfDay.now();

    return Scaffold(
      appBar: AppBar(title: Text("Date Time Example")),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                showDatePicker(context: context, initialDate: current, firstDate: kirkYilOnce, lastDate: current).then((value) {
                  debugPrint(DateTime.parse(value.toString()).toString());
                  debugPrint(formatDate(value!, [yy, '-', mm, '-', dd]));
                  });

              },
              child: Text(
                "Pick date",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(primary: Colors.green)),
          ElevatedButton(
            onPressed: () {
              showTimePicker(context: context, initialTime: currentTime).then((value){
                debugPrint(value!.format(context));
                debugPrint(value.hour.toString() + " : " + value.minute.toString());
              });
            },
            child: Text(
              "Pick time",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.blue),
          )
        ],
      )),
    );
  }
}
