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
          child: Column(
            children: [
              Text(
        "Orange Page",
        style: TextStyle(fontSize: 24),
      ),
      ElevatedButton(onPressed: () => Navigator.of(context).popUntil((route) => route.settings.name == "/purple"), child: Text("Go to purple.")),
      ElevatedButton(onPressed: () => Navigator.popUntil(context, (route) => route.isFirst), child: Text("Go to the main page.")),
      ElevatedButton(onPressed: (){
        Navigator.of(context).pushNamedAndRemoveUntil("/red", (route) => route.isFirst);
      }, child: Text("Add red after main page."))
            ],
          ),
    ));
  }
}
