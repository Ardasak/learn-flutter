import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigations/main.dart';
import 'package:flutter_navigations/orange_page.dart';
import 'package:flutter_navigations/red_page.dart';

class RouteGenerator {
  static Route<dynamic> _getRoute(Widget page) =>
      defaultTargetPlatform == TargetPlatform.android
          ? MaterialPageRoute(builder: (context) => page)
          : CupertinoPageRoute(builder: (context) => page);

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _getRoute(MainPage());
      case '/red':
        return _getRoute(RedPage());
      case '/orange':
        return _getRoute(OrangePage());
      default:
        return _getRoute(Scaffold(
          appBar: AppBar(
            title: Text("Unknown Route"),
            backgroundColor: Colors.red,
          ),
          body: Center(child: Text("404")),
        ));
    }
  }
}
