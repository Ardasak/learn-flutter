import 'package:flutter/material.dart';

class PageViewExample extends StatefulWidget {
  PageViewExample({Key? key}) : super(key: key);

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool horizontal = true;
  bool page_snapping = true;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemBuilder: (context, index) {
      return Column(
        children: [
          Expanded(
            child: PageView(
              key: PageStorageKey("my_pageview"),
              scrollDirection: horizontal ? Axis.horizontal : Axis.vertical,
              reverse: reverse,
              controller: myController,
              pageSnapping: page_snapping,
              onPageChanged: (index) {
                debugPrint("page change index: $index");
              },
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.indigo.shade300,
                  child: Center(child: Column(
                    children: [
                      Text("Sayfa 0", style: TextStyle(fontSize: 30),),
                      ElevatedButton(onPressed: (){
                        myController.nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
                      }, child: Text("Go to next page."))
                    ],
                  )),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.amberAccent,
                  child: Center(child: Text("Sayfa 1", style: TextStyle(fontSize: 30),)),
                ),
                Container(
                  width: double.infinity,
                  height: 300,
                  color: Colors.teal,
                  child: Center(child: Text("Sayfa 2", style: TextStyle(fontSize: 30),)),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.greenAccent,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Yatay Eksende Çalış"),
                      Checkbox(value: horizontal, onChanged: (value){
                        setState(() {
                          horizontal = value!;
                        });
                      })
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Page Snapping"),
                      Checkbox(value: page_snapping, onChanged: (value){
                        setState(() {
                          page_snapping = value!;
                        });
                      })
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      Text("Reverse"),
                      Checkbox(value: reverse, onChanged: (value){
                        setState(() {
                          reverse = value!;
                        });
                      })
                    ],),
                  ),

                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
