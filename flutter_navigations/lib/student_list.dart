import 'package:flutter/material.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int itemCount = ModalRoute.of(context)!.settings.arguments as int;
    List<Student> allStudents = List.generate(itemCount, (index) {
      return Student(
        index,
        '$index',
        "$index",
      );
    });
    print("eleman sayısı: $itemCount");
    return Scaffold(
        appBar: AppBar(
          title: Text("Student List"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: (){
              var selected = allStudents[index];
              Navigator.of(context).pushNamed("/studentDetail", arguments: selected);
            },
            leading: CircleAvatar(
              child: Text(allStudents[index].id.toString()),
            ),
            title: Text("Name: " + allStudents[index].name),
            subtitle: Text("Surname: " + allStudents[index].surname),
          ),
          itemCount: itemCount,
        ));
  }
}

class Student {
  final int id;
  final String name;
  final String surname;

  Student(this.id, this.name, this.surname);
}
