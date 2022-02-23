import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      title: "Stopwatch",
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool isStart = false;
  List<String> lap_list = List.empty(growable: true);
  int h = 0;
  int m = 0;
  int s = 0;
  int ms = 0;
  late Timer _timer;
  void _start() {
    setState(() {
      const oneMilSec = const Duration(milliseconds: 10);
      _timer = Timer.periodic(
        oneMilSec,
        (Timer timer) {
          setState(() {
            ms++;
            if (ms == 100) {
              s++;
              ms = 0;
            }
            if (s == 60) {
              m++;
              s = 0;
            }
            if (m == 60) {
              h++;
              m = 0;
            }
          });
        },
      );
    });
  }

  void _stop() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stopwatch"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 5),
                color: Colors.blue.shade100,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        get_text(h.toString(), m.toString(), s.toString(),
                            ms.toString()),
                        style: TextStyle(fontSize: 45),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: isStart
                                ? () {
                                    setState(() {
                                      lap_list.add(get_text(
                                          h.toString(),
                                          m.toString(),
                                          s.toString(),
                                          ms.toString()));
                                    });
                                  }
                                : () {
                                    setState(() {
                                      lap_list.clear();
                                      h = 0;
                                      m = 0;
                                      s = 0;
                                      ms = 0;
                                    });
                                  },
                            child: isStart ? Text("Lap") : Text("Reset")),
                        TextButton(
                            onPressed: isStart
                                ? () {
                                    setState(() {
                                      isStart = false;
                                      _stop();
                                    });
                                  }
                                : () {
                                    setState(() {
                                      isStart = true;
                                      _start();
                                    });
                                  },
                            child: isStart ? Text("Stop") : Text("Start")),
                      ],
                    ),
                  ],
                )),
            Expanded(
                child: ListView.builder(
                    itemCount: lap_list.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onLongPress: () {
                            setState(() {
                              lap_list.remove(lap_list[index]);
                            });
                          },
                          title: Text(lap_list[index]),
                          leading: Icon(
                            Icons.brightness_1,
                            color: Colors.blue.shade500,
                          ),
                          subtitle: Text("${index + 1}. tur"),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }

  String get_text(String h, String m, String s, String ms) {
    if (int.parse(h) < 10) {
      h = "0" + h;
    }
    if (int.parse(m) < 10) {
      m = "0" + m;
    }
    if (int.parse(s) < 10) {
      s = "0" + s;
    }
    if (int.parse(ms) < 10) {
      ms = "0" + ms;
    }

    return "$h:$m:$s:$ms";
  }
}
