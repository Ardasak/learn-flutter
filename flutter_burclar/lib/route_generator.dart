import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_burclar/sign_detail.dart';
import 'package:flutter_burclar/main.dart';
import 'package:flutter_burclar/model/sign.dart';



class RouteGenerator{
  static Route<dynamic>? generateRoute(RouteSettings settings){
    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (context) => MyApp());
      case "/detail":
        return MaterialPageRoute(builder: (context) => SignDetail(selectedSign: settings.arguments as Sign));
    }
  }

}