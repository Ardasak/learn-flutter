import 'package:flutter/material.dart';

class OrangePage extends StatelessWidget {
  const OrangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orange Page'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
          child: Container(
              child: Text(
        "Orange Page",
        style: TextStyle(fontSize: 24),
      ))),
    );
  }
}
