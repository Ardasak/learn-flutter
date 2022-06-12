import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/helper/data_helper.dart';
import 'package:flutter_dinamik_not/model/subject.dart';

import '../constants/app_constants.dart';

class SubjectList extends StatefulWidget {
  const SubjectList({Key? key}) : super(key: key);

  @override
  State<SubjectList> createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {
    List<Subject> allSubjects = DataHelper.allAddedSubjects;
    return allSubjects.length == 0 ? Container(child: Center(child: Text("Please add a subject.", style: Constants.titleStyle,))): ListView.builder(
        itemCount: allSubjects.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction){
              DataHelper.allAddedSubjects.removeAt(index);
              setState(() {
                
              });
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                child: ListTile(
                  title: Text(allSubjects[index].name),
                  leading: CircleAvatar(
                    backgroundColor: Constants.primaryColor,
                    child: Text(
                        (allSubjects[index].letter * allSubjects[index].credit)
                            .toStringAsFixed(0)),
                  ),
                  subtitle: Text("${allSubjects[index].credit} Kredi, Not Değeri ${allSubjects[index].letter}"),
                ),
              ),
            ),
          );
        });
  }
}
