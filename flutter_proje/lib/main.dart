import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _img1 = "https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg";
  String _img2 =
      'https://emrealtunbilek.com/wp-content/uploads/2016/10/apple-icon-72x72.png';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Scaffold(
          body: DartDersleriText(),
          appBar:
              AppBar(title: Text("Hello World"), backgroundColor: Colors.teal),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint("Tıklandı");
            },
            child: Icon(Icons.my_library_books_outlined, color: Colors.red),
            backgroundColor: Colors.blue,
          ),
        ));
  }

  Container DartDersleriText() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [getRow(), getColumn()],
      ),
    );
  }

  Container createContanier(String text, Color color, {EdgeInsets margin = EdgeInsets.zero}) {
    return Container(
      alignment: Alignment.center,
      height: 75,
      width: 75,
      margin: margin,
      color: color,
      child: Text(
        text,
        style: TextStyle(fontSize: 30),
      ),
    );
  }

  Expanded getColumn() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: createContanier("E", Colors.orange.shade200, margin: EdgeInsets.only(top:  15))
          ),
          Expanded(
            child: createContanier("R", Colors.orange.shade300, margin: EdgeInsets.only(top:  15))
          ),
          Expanded(
            child: createContanier("S", Colors.orange.shade400, margin: EdgeInsets.only(top:  15))
          ),
          Expanded(
            child: createContanier("L", Colors.orange.shade500, margin: EdgeInsets.only(top:  15))
          ),
          Expanded(
            child: createContanier("E", Colors.orange.shade600, margin: EdgeInsets.only(top:  15))
          ),
          Expanded(
            child: createContanier("R", Colors.orange.shade700, margin: EdgeInsets.only(top:  15))
          ),
          Expanded(
            child: createContanier("İ", Colors.orange.shade800, margin: EdgeInsets.only(top:  15))
          ),
        ],
      ),
    );
  }

  Row getRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        createContanier("D", Colors.orange.shade100),
        createContanier("A", Colors.orange.shade200),
        createContanier("R", Colors.orange.shade300),
        createContanier("T", Colors.orange.shade400)
      ],
    );
  }

  Expanded getColumnv2() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: createContanier("E", Colors.orange.shade200, margin: EdgeInsets.only(top:  15))
          ),
          Flexible(
            child: createContanier("R", Colors.orange.shade300, margin: EdgeInsets.only(top:  15))
          ),
          Flexible(
            child: createContanier("S", Colors.orange.shade400, margin: EdgeInsets.only(top:  15))
          ),
          Flexible(
            child: createContanier("L", Colors.orange.shade500, margin: EdgeInsets.only(top:  15))
          ),
          Flexible(
            child: createContanier("E", Colors.orange.shade600, margin: EdgeInsets.only(top:  15))
          ),
          Flexible(
            child: createContanier("R", Colors.orange.shade700, margin: EdgeInsets.only(top:  15))
          ),
          Flexible(
            child: createContanier("İ", Colors.orange.shade800, margin: EdgeInsets.only(top:  15))
          )
        ],
      ),
    );
  }

  Container ExpandedFlexibleDersleri() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sorunluContainer),
    );
  }

  List<Widget> get sorunluContainer {
    return <Widget>[
      Container(
        height: 75,
        width: 75,
        color: Colors.red,
      ),
      Container(
        height: 75,
        width: 75,
        color: Colors.yellow,
      ),
      Container(
        height: 75,
        width: 75,
        color: Colors.green,
      ),
      Container(
        height: 75,
        width: 75,
        color: Colors.blue,
      ),
      Container(
        height: 75,
        width: 75,
        color: Colors.yellow,
      ),
      Container(
        height: 75,
        width: 75,
        color: Colors.purple,
      )
    ];
  }

  List<Widget> get expandedContainer {
    return <Widget>[
      Expanded(
        flex: 2,
        child: Container(
          height: 75,
          width: 75,
          color: Colors.red,
        ),
      ),
      Expanded(
        flex: 3,
        child: Container(
          height: 75,
          width: 75,
          color: Colors.yellow,
        ),
      ),
      Expanded(
        child: Container(
          height: 75,
          width: 75,
          color: Colors.green,
        ),
      ),
      Expanded(
        child: Container(
          height: 75,
          width: 75,
          color: Colors.blue,
        ),
      ),
    ];
  }

  List<Widget> get flexibleContainer {
    return <Widget>[
      Flexible(
        flex: 1,
        child: Container(
          height: 300,
          width: 200,
          color: Colors.red,
        ),
      ),
      Flexible(
        child: Container(
          height: 300,
          width: 200,
          color: Colors.yellow,
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          height: 300,
          width: 200,
          color: Colors.blue,
        ),
      ),
      Flexible(
        child: Container(
          height: 300,
          width: 200,
          color: Colors.yellow,
        ),
      ),
      Flexible(
        child: Container(
          height: 300,
          width: 200,
          color: Colors.purple.shade900,
        ),
      ),
    ];
  }

  Container ColumnVeRowDersleri() {
    return Container(
      color: Colors.red.shade300,
      child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("A"),
                Text("R"),
                Text("D"),
                Text("A"),
              ],
            ),
            Icon(
              Icons.account_circle,
              size: 45,
              color: Colors.green,
            ),
            Icon(
              Icons.account_circle,
              size: 45,
              color: Colors.purple.shade100,
            ),
            Icon(
              Icons.account_circle,
              size: 45,
              color: Colors.blue,
            ),
            Icon(
              Icons.account_circle,
              size: 45,
              color: Colors.red,
            ),
            Text("Log in",
                textAlign: TextAlign.center, style: TextStyle(fontSize: 25))
          ],
        ),
      ),
    );
  }

  Center containerDersi() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(12),
        child: Container(
          margin: EdgeInsets.all(12),
          child: Text(
            "Arda Sak",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.rectangle,
            border: Border.all(color: Colors.red, width: 5),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50), topRight: Radius.circular(50)),
            image: DecorationImage(
              image: NetworkImage(_img2),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeatX,
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.green, offset: Offset(0, 20), blurRadius: 10),
              BoxShadow(
                  color: Colors.yellow, offset: Offset(-15, 0), blurRadius: 10)
            ]),
      ),
    );
  }
}
