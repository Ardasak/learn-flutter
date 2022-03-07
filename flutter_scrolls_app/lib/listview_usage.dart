import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListViewUsage extends StatelessWidget {
  ListViewUsage({Key? key}) : super(key: key);
  List<Student> allStudents = List.generate(
      5000,
      (index) => Student(index + 1, "Öğrenci adı ${index + 1}",
          "Öğrenci soyadı ${index + 1}"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student List")),
      body: ListViewSeparated(),
    );
  }

  ListView ListViewSeparated() {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: index % 2 == 0 ? Colors.red : Colors.green,
          child: ListTile(
            onTap: () {
              debugPrint("eleman tıklandı: $index");
              if ((index + 1) % 2 == 0) {
                EasyLoading.instance.backgroundColor = Colors.green;
              } else {
                EasyLoading.instance.backgroundColor = Colors.red;
              }
              EasyLoading.showError("Lan patlıcak telefon",
                  maskType: EasyLoadingMaskType.black);
            },
            onLongPress: () {
              alertDialogOperations(context, allStudents[index]);
            },
            title: Text(allStudents[index].name),
            subtitle: Text(allStudents[index].surname),
            leading: CircleAvatar(
              child: Text(allStudents[index].id.toString()),
            ),
          ),
        );
      },
      itemCount: allStudents.length,
      separatorBuilder: (context, index) {
        if ((index + 1) % 4 == 0) {
          return Divider(
            thickness: 2,
            color: Colors.black,
          );
        }
        return Container();
      },
    );
  }

  ListView OrdinaryListView() {
    return ListView(
      children: allStudents
          .map((e) => ListTile(
                title: Text(e.name),
                subtitle: Text(e.surname),
                leading: CircleAvatar(child: Text(e.id.toString())),
              ))
          .toList(),
    );
  }

  void alertDialogOperations(BuildContext context, Student student) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(student.id.toString()),
            // titleTextStyle: TextStyle(color: Colors.green, fontSize: 20),
            // backgroundColor: Colors.red,
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                Text("Arda Sak" * 100),
                Text("Arda Sak" * 100),
                Text("Arda Sak" * 100)
              ],
            )),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    EasyLoading.showToast("Dismissed",
                        toastPosition: EasyLoadingToastPosition.bottom);
                  },
                  child: Text("Dismiss")),
            ],
          );
        });
  }
}

class Student {
  final int id;
  final String name;
  final String surname;

  Student(this.id, this.name, this.surname);
}
