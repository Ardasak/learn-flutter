import 'package:flutter/material.dart';

class ListViewUsage extends StatelessWidget {
  ListViewUsage({Key? key}) : super(key: key);
  List<Student> allStudents = List.generate(
      50,
      (index) => Student(index + 1, "Öğrenci adı ${index + 1}",
          "Öğrenci soyadı ${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student List")),
      body: ListView(
        children: allStudents
            .map((e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.surname),
                  leading: CircleAvatar(child: Text(e.id.toString())),
                ))
            .toList(),
      ),
    );
  }
}

class Student {
  final int id;
  final String name;
  final String surname;

  Student(this.id, this.name, this.surname);
}
