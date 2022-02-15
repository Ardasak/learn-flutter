import 'package:flutter/material.dart';
import 'package:flutter_basic_widgets/basic_button_types.dart';
import 'package:flutter_basic_widgets/dropdown_button_usage.dart';
import 'package:flutter_basic_widgets/image_widgets.dart';
import 'package:flutter_basic_widgets/my_counter_page.dart';
import 'package:flutter_basic_widgets/popup_menu.dart';

void main() {
  debugPrint("main calisti");
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("myapp build calisti.");
    return MaterialApp(
      title: "My Counter App",
      theme: ThemeData(
          primarySwatch: Colors.red,
          outlinedButtonTheme: OutlinedButtonThemeData(style: OutlinedButton.styleFrom(primary: Colors.blue.shade700)),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple))),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image Widget"),
        ),
        body: PopUpMenu(),
      ),
    );
  }
}

/* 
İşe yaramıyor çünkü stateless, böyle bir durumda stateful kullanmamız lazım
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("myhomepage build calisti.");
    int sayi = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Arda Adam"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Butona ${sayi} kez basıldı.",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            sayi++;
            debugPrint(sayi.toString());
          }),
    );
  }
} */