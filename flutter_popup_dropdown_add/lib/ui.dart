import 'package:flutter/material.dart';

class myUI extends StatefulWidget {
  myUI({Key? key}) : super(key: key);

  @override
  State<myUI> createState() => _myUIState();
}

class _myUIState extends State<myUI> {
  List<String> myList = List.generate(3, (index) => "Item $index");
  TextEditingController _controller = TextEditingController();
  String? _selectedItem = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a value',
                ),
                onSubmitted: (value) {
                  setState(() {
                    myList.add(value);
                    _controller.clear();
                  });
                },
              ),
            ),
          ),
          PopupMenuButton(itemBuilder: ((context) {
            return myList
                .map((value) => PopupMenuItem(
                      child: Text(value),
                      value: value,
                    ))
                .toList();
          })),
          DropdownButton<String>(
            hint: Text("Items"),
            items: myList
                .map((e) => DropdownMenuItem(
                      child: Text(e),
                      value: e,
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
            },
            value: _selectedItem,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 36,
          )
        ],
      ),
    );
  }
}
