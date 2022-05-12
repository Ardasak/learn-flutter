import 'dart:math';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);
  int _randomNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Red Page'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              child: Text(
            "Red Page",
            style: TextStyle(fontSize: 24),
          )),
          ElevatedButton(
              onPressed: () {
                _randomNumber = Random().nextInt(100);
                debugPrint("Üretilen sayı: $_randomNumber");
                Navigator.of(context).pop(_randomNumber);
              },
              child: Text("Geri Dön"))
        ],
      )),
    );
  }
}
