import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabExample extends StatefulWidget {
  TabExample({Key? key}) : super(key: key);

  @override
  State<TabExample> createState() => _TabExampleState();
}

class _TabExampleState extends State<TabExample>
    with SingleTickerProviderStateMixin {
  var tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: myTabBarBottom(),
      appBar: AppBar(
        title: Text("Tab Usage"),
        bottom: myTabBar(),
      ),
      body: TabBarView(dragStartBehavior: DragStartBehavior.start,children: [
        Container(color: Colors.redAccent, child: Text("Container 1", style: TextStyle(fontSize: 48),),),
        Container(color: Colors.greenAccent, child: Text("Container 2", style: TextStyle(fontSize: 48),),),
        Container(color: Colors.blueAccent, child: Text("Container 3", style: TextStyle(fontSize: 48),),)
      ], controller: tabController,),
    );
  }

  TabBar myTabBar() {
    return TabBar(
        tabs: [
          Tab(
            icon: Icon(Icons.add),
            text: "Child 1",
          ),
          Tab(icon: Icon(Icons.remove)),
          Tab(icon: Icon(Icons.equalizer))
        ],
        controller: tabController,
      );
  }

    Widget myTabBarBottom() {
    return Container(
      color: Colors.tealAccent,
      child: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.add),
              text: "Child 1",
            ),
            Tab(icon: Icon(Icons.remove)),
            Tab(icon: Icon(Icons.equalizer))
          ],
          controller: tabController,
        ),
    );
  }
}
