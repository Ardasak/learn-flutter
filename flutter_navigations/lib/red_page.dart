import 'dart:math';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter/material.dart';

class RedPage extends StatelessWidget {
  RedPage({Key? key}) : super(key: key);
  int _randomNumber = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Red Page'),
          backgroundColor: Colors.red,
          // automaticallyImplyLeading: false,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Text("Back")),
            ElevatedButton(
              onPressed: () {
                if (Navigator.of(context).canPop()) {
                  debugPrint("Can pop");
                } else {
                  debugPrint("Can't pop");
                }
              },
              child: Text("Can Pop Kullanımı"),
              style: ElevatedButton.styleFrom(fixedSize: Size(120, 50)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, "/orange");
              },
              child: Text("Go to orange"),
              style: ElevatedButton.styleFrom(fixedSize: Size(120, 50)),
            ),
          ],
        )),
      ),
      onWillPop: () {
        // Navigator.of(context).pop();
        EasyLoading.showInfo("Please press the back button to leave the page.",
            maskType: EasyLoadingMaskType.black,
            duration: Duration(seconds: 2));
        return Future.value(false);
      },
    );
  }
}
