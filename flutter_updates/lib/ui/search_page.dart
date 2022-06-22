import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index){
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(15),
          color: index % 2 == 0 ? Colors.red : Colors.blue,
          child: Center(
            child: Text("$index"),
          ),
        ),
      );
    }, itemExtent: 300, itemCount: 20,);
  }
}