import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  var imgPath;

  Detail({required this.imgPath, Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Hero(
          tag: widget.imgPath,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          left: 15,
          right: 15,
          bottom: 15,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 4,
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular((10))),
              child: Column(children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            image: DecorationImage(
                                image: AssetImage("assets/dress.jpg"),
                                fit: BoxFit.contain)),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "LAMINATED",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: "CustomFont",
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Louis Vuitton",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: "CustomFont",
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 170,
                          child: Text(
                            "One button V-neck sling long-sleeved waist female stitching dress",
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "CustomFont",
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$6500",
                        style: TextStyle(
                            fontFamily: "CustomFont",
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.10,
                        child: FloatingActionButton(
                          backgroundColor: Colors.brown,
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_forward_ios,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height / 2,
            left: 50,
            child: Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "LAMINATED",
                      style: TextStyle(
                          fontFamily: "CustomFont",
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    )
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}
