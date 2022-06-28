import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const ModaApp());

class ModaApp extends StatelessWidget {
  const ModaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.camera_alt,
              color: Colors.black,
            ),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Moda App",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "CustomFont",
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(padding: EdgeInsets.only(top: 10), children: [
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.blue,
          height: 140,
          width: double.infinity,
          child: ListView(scrollDirection: Axis.horizontal, children: [
            listItem("assets/model1.jpeg", "assets/chanellogo.jpg"),
            SizedBox(
              width: 25,
            ),
            listItem("assets/model2.jpeg", "assets/louisvuitton.jpg"),
            SizedBox(
              width: 25,
            ),
            listItem("assets/model3.jpeg", "assets/chloelogo.png"),
            SizedBox(
              width: 25,
            ),
            listItem("assets/model1.jpeg", "assets/chanellogo.jpg"),
            SizedBox(
              width: 25,
            ),
            listItem("assets/model2.jpeg", "assets/louisvuitton.jpg"),
            SizedBox(
              width: 25,
            ),
            listItem("assets/model3.jpeg", "assets/chloelogo.png"),
            SizedBox(
              width: 25,
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(16),
            color: Colors.blue.shade300,
            child: Container(
              padding: EdgeInsets.all(16),
              height: 450,
              width: double.infinity,
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage("assets/model1.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(
                          "Daisy",
                          style: TextStyle(fontFamily: 'CustomFont', fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "34 mins ago",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "CustomFont",
                              fontSize: 10),
                        )
                      ]),
                    ),
                    SizedBox(width: 10,),
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: 22,
                    )
                  ],
                )
              ]),
            ),
          ),
        )
      ]),
    );
  }

  Widget listItem(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.cover)),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(logoPath), fit: BoxFit.cover),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.brown),
          child: Center(
              child: Text(
            "Follow",
            style: TextStyle(color: Colors.white, fontFamily: "CustomFont"),
          )),
        )
      ],
    );
  }
}
