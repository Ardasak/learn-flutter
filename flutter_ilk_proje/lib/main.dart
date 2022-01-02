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
          heightFactor: 3,
          widthFactor: 3,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.red,
            child: Text("Arda"),
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
