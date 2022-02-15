import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  PopUpMenu({Key? key}) : super(key: key);

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Center(child: PopupMenuButton(
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[];
      },
    ));
  }
}
