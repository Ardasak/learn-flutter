import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constants/app_constants.dart';
import 'package:flutter_dinamik_not/helper/data_helper.dart';
import 'package:flutter_dinamik_not/model/subject.dart';
import 'package:flutter_dinamik_not/widgets/dropdown_widget.dart';
import 'package:flutter_dinamik_not/widgets/show_average_page.dart';
import 'package:flutter_dinamik_not/widgets/subject_list.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  double selectedCreditValue = 1;
  String lessonNameEntry = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
              child: Text(
            Constants.titleText,
            style: Constants.titleStyle,
          )),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: _buildForm,
                ),
                Expanded(
                  flex: 4,
                  child: ShowAverage(subjectCount: DataHelper.allAddedSubjects.length, average: DataHelper.calculateAverage()),
                )
              ],
            ),
            Expanded(
              child: SubjectList(
                onDismiss: (index){
                  DataHelper.allAddedSubjects.removeAt(index);
                  setState(() {
                    
                  });
                },
              ),
            )
          ],
        ));
  }

  get _buildForm => Form(
      autovalidateMode: AutovalidateMode.always,
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Constants.paddingHorizontal8,
            child: _buildTextFormField,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Padding(
                padding: Constants.paddingHorizontal8,
                child: _buildLetters,
              )),
              Expanded(
                  child: Padding(
                padding: Constants.paddingHorizontal8,
                child: _buildCredits,
              )),
              IconButton(
                onPressed: _addSubjectAndCalculateAverage,
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Constants.primaryColor,
                ),
                iconSize: 30,
              )
            ],
          ),
          SizedBox(height: 5)
        ],
      ));

  get _buildLetters => DropdownWidget(items: DataHelper.returnList(), defaultSelected: selectedLetterValue, onChanged: (value){
    selectedLetterValue = value;
  },);

  get _buildTextFormField => TextFormField(
        onSaved: ((newValue) => setState(() {
              lessonNameEntry = newValue!;
            })),
        validator: (value) {
          if (value!.length <= 0) {
            return "Enter subject name.";
          }
        },
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: Constants.textFieldBorderRadius),
            hintText: "Maths",
            filled: true,
            fillColor: Constants.primaryColor.shade100.withOpacity(0.3)),
      );

  get _buildCredits => DropdownWidget(items: DataHelper.allCreditItems, defaultSelected: selectedCreditValue, onChanged: (value){
    selectedCreditValue = value;
  },);

  void _addSubjectAndCalculateAverage() {
    if(formKey.currentState!.validate()){
      formKey.currentState!.save();
      var subject = Subject(name: lessonNameEntry, letter: selectedLetterValue, credit: selectedCreditValue);
      DataHelper.addSubject(subject);
      setState(() {
        
      });
    }
  }
}
