import 'package:flutter/material.dart';
import 'package:textfield_features/sayac_state.dart';

class GlobalKeyUsage extends StatelessWidget {
  
  GlobalKeyUsage({Key? key}) : super(key: key);
  final sayacWidgetKey = GlobalKey<SayacWidgetState>(); 
  

  @override
  Widget build(BuildContext context) {
    print("1");
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key Usage"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("How many times button pressed:"), SayacWidget(key: sayacWidgetKey,), Text(sayacWidgetKey.currentState?.counter.toString() ?? "0")],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.green,
        ),
        backgroundColor: Colors.orange,
        onPressed: () {
          sayacWidgetKey.currentState!.arttir();
        },
      ),
    );
  }
}
