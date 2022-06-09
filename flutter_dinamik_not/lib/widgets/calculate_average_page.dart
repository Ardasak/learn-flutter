import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not/constants/app_constants.dart';
import 'package:flutter_dinamik_not/helper/data_helper.dart';
import 'package:flutter_dinamik_not/widgets/show_average_page.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculateAveragePage extends StatefulWidget {
  CalculateAveragePage({Key? key}) : super(key: key);

  @override
  State<CalculateAveragePage> createState() => _CalculateAveragePageState();
}

class _CalculateAveragePageState extends State<CalculateAveragePage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double selectedLetterValue = 4;
  int selectedCreditValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: ShowAverage(subjectCount: 1, average: 2.55),
                )
              ],
            ),
            Expanded(
              child: Container(
                child: Text("Liste buraya gelecek"),
                color: Colors.blue,
              ),
            )
          ],
        ));
  }

  get _buildForm => Form(
      key: formKey,
      child: Column(
        children: [
          Padding(padding: Constants.paddingHorizontal8, child: _buildTextFormField,),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Expanded(child: Padding(padding: Constants.paddingHorizontal8, child: _buildLetters,)), Expanded(child: Padding(padding: Constants.paddingHorizontal8, child: _buildCredits,)), IconButton(onPressed: (){

            }, icon: Icon(Icons.arrow_forward_ios_sharp, color: Constants.primaryColor,), iconSize: 30,)],
          ),
          SizedBox(height: 5)
        ],
      ));

  get _buildLetters => Container(
    alignment: Alignment.center,
    padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.primaryColor.shade100.withOpacity(0.3),
        borderRadius: Constants.textFieldBorderRadius,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<double>(
          elevation: 16,
          value: selectedLetterValue,
          items: DataHelper.returnList(),
          onChanged: (value) {
            setState(() {
              selectedLetterValue = value!;
              debugPrint(value.toString());
            });
          },
        ),
      ));

  get _buildTextFormField => TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: Constants.textFieldBorderRadius),
            hintText: "Maths",
            filled: true,
            fillColor: Constants.primaryColor.shade100.withOpacity(0.3)),
      );

    get _buildCredits => Container(
    alignment: Alignment.center,
    padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.primaryColor.shade100.withOpacity(0.3),
        borderRadius: Constants.textFieldBorderRadius,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          elevation: 16,
          value: selectedCreditValue,
          items: DataHelper.allCreditItems,
          onChanged: (value) {
            setState(() {
              selectedCreditValue = value!;
              debugPrint(value.toString());
            });
          },
        ),
      ));
}

