import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class GridViewUsage extends StatelessWidget {
  const GridViewUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GridView Usage",
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () => null,
            iconSize: 25,
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () => null,
            iconSize: 25,
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () => null,
            iconSize: 25,
          ),
        ],
      ),
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: GridViewBuilder(),
      ),
    );
  }

  GridView GridViewBuilder() {
    return GridView.builder(
        itemCount: 11,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => EasyLoading.showSuccess("$index tıklandı."),
            onLongPress: () => EasyLoading.showSuccess("$index uzun basıldı."),
            onDoubleTap: () => EasyLoading.showSuccess("$index çift tıklandı."),
            onHorizontalDragEnd: (details) =>
                EasyLoading.showSuccess("$index horizontal kaydırıldı."),
            onVerticalDragEnd: (details) =>
                EasyLoading.showSuccess("$index vertical kaydırıldı."),
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 5,
                  )
                ],
                border: Border.all(
                  color: Colors.black.withOpacity(0.5),
                  width: 2,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg"),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(colors: [
                  Colors.blue,
                  Colors.red.shade100,
                  Colors.orange.shade200,
                  Colors.purple.shade300,
                  Colors.teal.shade400,
                  Colors.amber.shade500,
                  Colors.cyan.shade600,
                  Colors.black,
                  Colors.white,
                  Colors.brown.shade900,
                ], begin: Alignment(-0.5, -0.5), end: Alignment(0.5, 0.5)),
                shape: BoxShape.rectangle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "$index",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }

  GridView GridViewCount() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      primary: false,
      reverse: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.center,
          child: const Text(
            "Merhaba Flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade200,
          child: const Text("Merhaba Flutter 2"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade300,
          child: const Text("Merhaba Flutter 3"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade400,
          child: const Text("Merhaba Flutter 4"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade100,
          child: const Text("Merhaba Flutter 5"),
        ),
      ],
    );
  }

  GridView GridViewExtent() {
    return GridView.extent(
      scrollDirection: Axis.vertical,
      maxCrossAxisExtent: 150,
      primary: false,
      reverse: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: const BorderRadius.all(const Radius.circular(20))),
          alignment: Alignment.center,
          child: const Text(
            "Merhaba Flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade200,
          child: const Text("Merhaba Flutter 2"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade300,
          child: const Text("Merhaba Flutter 3"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade400,
          child: const Text("Merhaba Flutter 4"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade100,
          child: const Text("Merhaba Flutter 5"),
        ),
      ],
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
