import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class CustomScrollViewUsage1 extends StatefulWidget {
  CustomScrollViewUsage1({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewUsage1> createState() => _CustomScrollViewUsage1State();
}

class _CustomScrollViewUsage1State extends State<CustomScrollViewUsage1> {
  @override
  Widget build(BuildContext context) {
    Timer timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        debugPrint("Timer");
      });
    });
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.pinkAccent,
            expandedHeight: 196,
            floating: false,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Flexible Space Bar"),
              centerTitle: true,
              background: Image.network(
                  "https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg"),
            ),
            pinned: false,
          ),
          SliverList(
            delegate: SliverChildListDelegate(fixedList()),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(_DynamicItemProduction,
                  childCount: 6)),
        ],
      ),
    );
  }

  List<Widget> fixedList() {
    return [
      Container(
        height: 150,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 2",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }

  Widget? _DynamicItemProduction(context, index) => Container(
        color: randomColor(),
        height: 150,
        child: Center(
          child: Text(
            "Dynamic List Item ${index + 1}",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Color? randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

  changeState() {
    setState(() {});
  }
}

class CustomScrollViewUsage extends StatelessWidget {
  const CustomScrollViewUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.pinkAccent,
            expandedHeight: 196,
            floating: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Sliver App Bar"),
              centerTitle: true,
              background: Image.network(
                  "https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg"),
            ),
            pinned: true,
          ),
          SliverPadding(
            padding: EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate(fixedList),
            ),
          ),
          SliverGrid(
            delegate: SliverChildListDelegate(fixedList),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2.0),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(_DynamicItemProduction,
                  childCount: 6),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 100,
                  childAspectRatio: 3.0)),
          SliverGrid(
              delegate: SliverChildBuilderDelegate(_DynamicItemProduction,
                  childCount: 6),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200)),
          SliverGrid.count(
              crossAxisCount: 2, childAspectRatio: 2.0, children: fixedList),
          SliverGrid.extent(
              maxCrossAxisExtent: 300,
              childAspectRatio: 2.0,
              children: fixedList),
          SliverPadding(
            padding: EdgeInsets.all(16),
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(_DynamicItemProduction,
                    childCount: 6)),
          ),
          SliverPadding(
              padding: EdgeInsets.all(24),
              sliver: SliverFixedExtentList(
                  delegate: SliverChildListDelegate(fixedList),
                  itemExtent: 150)),
          SliverPadding(
            padding: EdgeInsets.all(32),
            sliver: SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(_DynamicItemProduction,
                    childCount: 6),
                itemExtent: 100),
          )
        ],
      ),
    );
  }

  Widget? _DynamicItemProduction(context, index) => Container(
        color: randomColor(),
        height: 150,
        child: Center(
          child: Text(
            "Dynamic List Item ${index + 1}",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      );

  Color? randomColor() => Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));

  List<Widget> get fixedList {
    return [
      Container(
        height: 150,
        color: Colors.amber,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 1",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.teal,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 2",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.blue,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 3",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.red,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 4",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.orange,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 5",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        height: 150,
        color: Colors.purple,
        alignment: Alignment.center,
        child: Text(
          "Fixed List Item 6",
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
