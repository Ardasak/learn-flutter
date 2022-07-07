import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_moda_app/detay.dart';

void main() => runApp(const ModaApp());

class ModaApp extends StatelessWidget {
  const ModaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      theme: ThemeData().copyWith(splashColor: Colors.red),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
            indicatorColor: Colors.transparent,
            controller: tabController,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.more,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.navigation,
                  color: Colors.grey,
                  size: 22,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: Colors.grey,
                  size: 22,
                ),
              )
            ]),
      ),
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
            child: Container(
              padding: EdgeInsets.all(16),
              height: 500,
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
                              style: TextStyle(
                                  fontFamily: 'CustomFont',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
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
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                      size: 22,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "This official website features a ribbed knit jacket that is modern"
                  "and stylish. It looks very temparament and is recommended to everyone.",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "CustomFont",
                      color: Colors.grey),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => Detail(
                                  imgPath: "assets/modelgrid1.jpeg",
                                ))));
                      },
                      child: Hero(
                        tag: "assets/modelgrid1.jpeg",
                        child: Container(
                          height: 200,
                          width: (MediaQuery.of(context).size.width - 50) / 2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage("assets/modelgrid1.jpeg"),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detail(
                                        imgPath: "assets/modelgrid2.jpeg",
                                      ))),
                          child: Hero(
                            tag: "assets/modelgrid2.jpeg",
                            child: Container(
                              height: 100,
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/modelgrid2.jpeg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => Detail(
                                      imgPath: "assets/modelgrid3.jpeg"))),
                          child: Hero(
                            tag: "assets/modelgrid3.jpeg",
                            child: Container(
                              height: 100,
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/modelgrid3.jpeg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.brown.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          "# Louis Vuitton",
                          style: TextStyle(
                              fontFamily: "CustomFont",
                              fontSize: 10,
                              color: Colors.brown),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 25,
                      width: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.brown.withOpacity(0.2)),
                      child: Center(
                        child: Text(
                          "# Chloe",
                          style: TextStyle(
                              fontFamily: "CustomFont",
                              fontSize: 10,
                              color: Colors.brown),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.reply,
                      textDirection: TextDirection.rtl,
                      color: Colors.brown.withOpacity(0.4),
                      size: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "1.7K",
                      style: TextStyle(fontFamily: "CustomFont", fontSize: 16),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Icon(
                      Icons.comment,
                      size: 30,
                      color: Colors.brown.withOpacity(0.4),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "325",
                      style: TextStyle(fontFamily: "CustomFont", fontSize: 16),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 245,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 30,
                          ),
                          Text(
                            "2.3K",
                            style: TextStyle(
                                fontFamily: "CustomFont", fontSize: 16),
                          )
                        ],
                      ),
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
