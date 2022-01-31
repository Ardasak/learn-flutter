import 'package:flutter/material.dart';

class MyCounterPage extends StatefulWidget {
  
MyCounterPage({Key? key}) : super(key: key);

  @override
  State<MyCounterPage> createState() => _MyCounterPageState();
}

class _MyCounterPageState extends State<MyCounterPage> {
  int sayi = 0;
  @override
  Widget build(BuildContext context) {
    debugPrint("myhomepage build calisti.");

    return Scaffold(
      appBar: AppBar(
        title: Text("Arda Adam"),
      ),
      body: Center(
        child: CounterText(sayi: sayi),
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

class CounterText extends StatelessWidget {
  const CounterText({
    Key? key,
    required this.sayi,
  }) : super(key: key);

  final int sayi;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Butona ${sayi} kez basıldı.",
      style: Theme.of(context).textTheme.headline1,
    );
  }
}