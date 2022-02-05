import 'package:flutter/material.dart';

class BasicButtons extends StatelessWidget {
  const BasicButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onFocusChange: (value) {
              debugPrint(value.toString());
            },
            onPressed: () {},
            onLongPress: () {
              debugPrint("Long Press");
            },
            style: ButtonStyle(),
            child: Text("Text Button")),
        TextButton.icon(
            onPressed: () {},
            style: ButtonStyle(
                // backgroundColor: MaterialStateProperty.all(Colors.red),
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.red;
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.blue;
                  }
                  return null;
                }),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                overlayColor:
                    MaterialStateProperty.all(Colors.amber.withOpacity(0.5))),
            icon: Icon(Icons.add),
            label: Text("Text Button with Icon")),
        ElevatedButton(onPressed: () {}, child: Text("Elevated Button")),
        ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.white, onPrimary: Colors.black),
            icon: Icon(Icons.add),
            label: Text("Elevated Button with Icon")),
        OutlinedButton(onPressed: () {}, child: Text("Outlined Button")),
        OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red, width: 3.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(18.0))),
            ),
            icon: Icon(Icons.add),
            label: Text("Outlined Button with Icon"))
      ],
    );
  }
}
