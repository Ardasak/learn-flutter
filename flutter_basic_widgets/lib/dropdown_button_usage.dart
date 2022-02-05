import 'dart:developer';

import 'package:flutter/material.dart';

class DropdownButtonUsage extends StatefulWidget {
  DropdownButtonUsage({Key? key}) : super(key: key);

  @override
  State<DropdownButtonUsage> createState() => _DropdownButtonUsageState();
}

class _DropdownButtonUsageState extends State<DropdownButtonUsage> {
  String? _selectedCity = null;
  List<String> _allCities = ["Ankara", "Bursa", "İstanbul", "İzmir"];
  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        hint: Text("Şehir seçiniz..."),
        // items: [
        //   DropdownMenuItem(
        //     child: Text("Ankara"),
        //     value: "Ankara",
        //   ),
        //   DropdownMenuItem(
        //     child: Text("İzmir"),
        //     value: "İzmir",
        //   ),
        //   DropdownMenuItem(
        //     child: Text("Bursa"),
        //     value: "Bursa",
        //   )
        // ],
        items: _allCities.map((currentElement) => DropdownMenuItem(child: Text(currentElement), value: currentElement,)).toList(),
        value: _selectedCity,
        onChanged: (value) {
          setState(() {
            _selectedCity = value;
          });
        },
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 36,
        underline: Container(
          height: 4,
          color: Colors.purple,
        ),
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}
