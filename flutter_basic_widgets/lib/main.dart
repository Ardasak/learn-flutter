import 'package:flutter/material.dart';

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
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int sayi = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint("myhomepage build calisti.");

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
            sayiArttir();
            debugPrint(sayi.toString());
          }),
    );
  }

  void sayiArttir() {
    setState(() {
      sayi++;
    });
  }
}
