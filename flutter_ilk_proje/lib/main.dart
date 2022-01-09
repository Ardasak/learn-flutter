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
        body: Center(
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
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
                image: DecorationImage(
                  image: NetworkImage(_img2),
                  fit: BoxFit.scaleDown,
                  repeat: ImageRepeat.repeatX,
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.green,
                      offset: Offset(0, 15),
                      blurRadius: 10),
                  BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(15, 0),
                      blurRadius: 10)
                ]),
          ),
        ),
        appBar:
            AppBar(title: Text("Hello World"), backgroundColor: Colors.teal),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Tıklandı");
          },
          child: Icon(Icons.my_library_books_outlined, color: Colors.red),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
