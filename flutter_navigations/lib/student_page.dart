import 'package:flutter/material.dart';
import 'package:flutter_navigations/student_list.dart';

class studentDetail extends StatelessWidget {
  final Student selectedStudent;
  const studentDetail({required this.selectedStudent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text("Student ${selectedStudent.id} Detail")),
      body: Center(
          child: Column(
        children: [
          Text(selectedStudent.id.toString()),
          Text("Name: " + selectedStudent.name),
          Text("Surname: " + selectedStudent.surname)
        ],
      )),
    );
  }
}
