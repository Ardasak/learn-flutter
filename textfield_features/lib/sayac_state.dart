import 'package:flutter/material.dart';

class SayacWidget extends StatefulWidget {
  SayacWidget({Key? key}) : super(key: key);

  @override
  State<SayacWidget> createState() => SayacWidgetState();
}

class SayacWidgetState extends State<SayacWidget> {
  int counter = 0;
  void arttir(){
    counter++;
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(2.toString());
    return Text(counter.toString(), style: Theme.of(context).textTheme.headline1,);
  }
}
