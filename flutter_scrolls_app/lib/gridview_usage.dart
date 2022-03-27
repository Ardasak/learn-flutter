import 'package:flutter/material.dart';

class GridViewUsage extends StatelessWidget {
  const GridViewUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GridView Usage",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.code),
            onPressed: () => null,
            iconSize: 25,
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () => null,
            iconSize: 25,
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
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
        itemCount: 201,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.teal[100 * (index % 9)],
            child: Text("$index"),
          );
        });
  }

  GridView GridViewCount() {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 3,
      primary: false,
      reverse: false,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.center,
          child: Text(
            "Merhaba Flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade200,
          child: Text("Merhaba Flutter 2"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade300,
          child: Text("Merhaba Flutter 3"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade400,
          child: Text("Merhaba Flutter 4"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade100,
          child: Text("Merhaba Flutter 5"),
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
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.orange.shade100,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          alignment: Alignment.center,
          child: Text(
            "Merhaba Flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade200,
          child: Text("Merhaba Flutter 2"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade300,
          child: Text("Merhaba Flutter 3"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade400,
          child: Text("Merhaba Flutter 4"),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.orange.shade100,
          child: Text("Merhaba Flutter 5"),
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
