import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/main.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/red_page.dart';
import 'package:flutter_navigations/student_list.dart';

class RouteGenerator {
  static Route<dynamic> _getRoute(Widget page, RouteSettings settings) =>
      defaultTargetPlatform == TargetPlatform.android
          ? MaterialPageRoute(builder: (context) => page, settings: settings)
          : CupertinoPageRoute(builder: (context) => page, settings: settings);

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _getRoute(MainPage(), settings);
      case '/red':
        return _getRoute(RedPage(), settings);
      case '/orange':
        return _getRoute(OrangePage(), settings);
      case '/studentList':
        print(settings.name);
        print(settings.arguments);
        return _getRoute(StudentList(), settings);
      default:
        return _getRoute(Scaffold(
          appBar: AppBar(
            title: Text("Unknown Route"),
            backgroundColor: Colors.red,
          ),
          body: Center(child: Text("404")),
        ), settings);
    }
  }
}
