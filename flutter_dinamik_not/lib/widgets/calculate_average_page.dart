import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constants/app_constants.dart';
import 'package:flutter_dinamik_not/widgets/show_average_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(child: Text(Constants.titleText, style: Constants.titleStyle,)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Row(
          children: [
            Expanded(flex: 7, child: _buildForm,),
            Expanded(flex: 4, child: ShowAverage(subjectCount: 1, average: 2.55),)
          ],
        ),
        Expanded(
          child: Container(
            child: Text("Liste buraya gelecek"),
            color: Colors.blue,
          ),
        )
      ],)
    );
  }

  get _buildForm => Form(key: formKey, child: Column(
    children: [
      _buildTextFormField,
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: () {

          }, icon: Icon(Icons.forward, color: Colors.teal,))
        ],
      )
    ],
  ));

  get _buildTextFormField => TextFormField(
    decoration: InputDecoration(hintText: "Maths", border: OutlineInputBorder(borderRadius: Constants.textFieldBorderRadius), filled: true, fillColor: Constants.primaryColor.shade100.withOpacity(0.3)),
  );
}