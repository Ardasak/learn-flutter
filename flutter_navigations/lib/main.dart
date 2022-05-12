import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/red_page.dart';

import 'orange_page.dart';
import 'dart:io' show Platform;

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material App Bar",
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  int? _gelenSayi = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Navigation Islemleri'),
        ),
        body: Center(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () async {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => RedPage()));

                  if (Platform.isAndroid) {
                    await Navigator.of(context)
                        .push<int>(MaterialPageRoute(
                            builder: (redContext) => RedPage()))
                        .then((int? value) {
                      _gelenSayi = value;
                      debugPrint('Gelen sayı: $value');
                    });
                  } else if (Platform.isIOS) {
                    await Navigator.of(context)
                        .push<int>(CupertinoPageRoute(
                            builder: (redContext) => RedPage()))
                        .then((int? value) {
                      _gelenSayi = value;
                      debugPrint('Gelen sayı: $value');
                      ;
                    });
                  }

                  print(_gelenSayi);
                },
                child: Icon(
                  Icons.abc,
                  color: Colors.red,
                  size: 48,
                ),
                style: ElevatedButton.styleFrom(fixedSize: Size(120, 50)),
              ),
            )
          ],
        )));
  }
}
