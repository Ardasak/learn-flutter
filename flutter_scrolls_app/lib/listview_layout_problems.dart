import 'package:flutter/material.dart';

class ListviewLayoutProblems extends StatelessWidget {
  const ListviewLayoutProblems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _controller = ScrollController();
    return Scaffold(
      appBar: AppBar(title: Text("Listview Layout Problems")),
      body: Container(
        height: 200,
        child: Row(
          children: [
            Text("Başladı"),
            Expanded(
              child: ListView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                reverse: true,
                children: [
                  GestureDetector(
                    onTap: () {
                      _controller.animateTo(300,
                          duration: Duration(seconds: 2),
                          curve: Curves.slowMiddle);
                      debugPrint("basti");
                    },
                    child: Container(
                      width: 200,
                      color: Colors.orange.shade200,
                    ),
                  ),
                  Container(
                    width: 200,
                    color: Colors.orange.shade400,
                  ),
                  Container(
                    width: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    width: 200,
                    color: Colors.orange.shade400,
                  ),
                ],
              ),
            ),
            Text("Bitti")
          ],
        ),
        decoration:
            BoxDecoration(border: Border.all(width: 4, color: Colors.red)),
      ),
    );
  }

  Column ListInColumn() {
    return Column(
      children: [
        Text("Başladı."),
        Flexible(
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Container(
                height: 200,
                color: Colors.orange.shade200,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade400,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade200,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade400,
              ),
            ],
          ),
        ),
        Text("Bitti.")
      ],
    );
  }
}
