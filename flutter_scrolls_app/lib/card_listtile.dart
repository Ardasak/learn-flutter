import 'package:flutter/material.dart';

class CardAndListTileUsage extends StatelessWidget {
  const CardAndListTileUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card and ListTile"),
      ),
      body: Center(
        child: SingleChildScrollUsage(),
      ),
    );
  }

  ListView ListViewUsage() {
    return ListView(
        reverse: true,
        children: [
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          CardMethod(),
          Text("Selam"),
          ElevatedButton.icon(
              onPressed: () {}, icon: Icon(Icons.add), label: Text("Selam"))
        ],
      );
  }

  SingleChildScrollView SingleChildScrollUsage() {
    return SingleChildScrollView(
      child: Column(children: [
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod(),
        CardMethod()
      ]),
    );
  }

  Column CardMethod() {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: CircleAvatar(child: Icon(Icons.add)),
            title: Text("Test Title"),
            subtitle: Text("Test Subtitle"),
            trailing: CircleAvatar(child: Icon(Icons.remove)),
          ),
          elevation: 12,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          shadowColor: Colors.red,
        ),
        Divider(
          color: Colors.red,
          thickness: 1,
          height: 10,
          indent: 20,
          endIndent: 20,
        )
      ],
    );
  }
}
