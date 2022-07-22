import 'package:flutter/material.dart';
import 'package:flutter_json_http/local_json.dart';
import 'package:flutter_json_http/remote.api.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      home: MyHomePage(),
      routes: {
        "/localJsonPage": (context) => LocalJson(),
        "/remoteApi": ((context) => RemoteApi())
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
        title: Text("Http Json"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/localJsonPage");
              },
              child: Text("Local Json"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/remoteApi");
              },
              child: Text("Remote Api"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow)),
            ),
          ],
        ),
      ),
    );
  }
}
