import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class DropdownWidget extends StatefulWidget {
  List<DropdownMenuItem<double>> items;
  final Function onChanged;
  double defaultSelected;
  DropdownWidget({required this.items, required this.defaultSelected, required this.onChanged, Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState(items: this.items, selectedValue: defaultSelected, onChanged: this.onChanged);
}



class _DropdownWidgetState extends State<DropdownWidget> {
  double selectedValue;
  final Function onChanged;
  List<DropdownMenuItem<double>> items;
  _DropdownWidgetState({required this.items, required this.selectedValue, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Constants.dropDownPadding,
      decoration: BoxDecoration(
        color: Constants.primaryColor.shade100.withOpacity(0.3),
        borderRadius: Constants.textFieldBorderRadius,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<double>(
          elevation: 16,
          value: selectedValue,
          items: items,
          onChanged: (value){
            selectedValue = value!;
            setState(() {
              
            });
            onChanged(value);
          }
        ),
      ));
  }
}