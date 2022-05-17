import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_navigations/route_generator.dart';

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
      // home: MainPage(),
      builder: EasyLoading.init(),
      // routes: {
      //   '/red': (context) => RedPage(),
      //   '/orange': (context) => OrangePage(),
      //   '/': (context) => MainPage(),
      // },
      // onUnknownRoute: (settings) => MaterialPageRoute(
      //   builder: (context) => Scaffold(
      //     appBar: AppBar(
      //       title: Text("Unknown Route"),
      //       backgroundColor: Colors.red,
      //     ),
      //     body: Center(child: Text("404")),
      //   ),
      // ),
      onGenerateRoute: RouteGenerator.routeGenerator,
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
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).maybePop();
                },
                child: Text("Maybe Pop Kullanımı"),
                style: ElevatedButton.styleFrom(fixedSize: Size(120, 50)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
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
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => OrangePage()));
                },
                child: Text("Push Replacement Kullanımı"),
                style: ElevatedButton.styleFrom(fixedSize: Size(120, 60)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/orange');
                },
                child: Text("PushNamed Kullanımı"),
                style: ElevatedButton.styleFrom(fixedSize: Size(120, 50)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/yellow');
                  },
                  child: Text(
                    "PushNamed Kullanımı",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120, 50),
                    primary: Colors.yellow,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/studentList', arguments: 60);
                },
                child: Text("Create List"),
                style: ElevatedButton.styleFrom(fixedSize: Size(120, 50)),
              ),
            ),
          ],
        )));
  }
}
