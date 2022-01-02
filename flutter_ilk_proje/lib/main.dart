import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            child: Container(
              alignment: Alignment.center,
              child: Text("naber"),
              width: 100,
              height: 100,
              margin: EdgeInsets.all(30),
              color: Colors.blue,
            ),
          ),
        ),
        appBar:
            AppBar(title: Text("Hello World"), backgroundColor: Colors.teal),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Tıklandı");
          },
          child: Icon(Icons.my_library_books_outlined, color: Colors.red),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
