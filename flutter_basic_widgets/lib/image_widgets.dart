import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);
  final _imgUrl =
      "https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg";

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Container(
            color: Colors.red,
            width: 150,
            height: 150,
            child: Image.asset(
              "assets/images/ege.jpeg",
              fit: BoxFit.cover,
            )),
        Container(
            color: Colors.red,
            width: 150,
            height: 150,
            child: Image.network(
              _imgUrl,
              fit: BoxFit.cover,
            )),
        Container(
            child: CircleAvatar(
          backgroundImage: NetworkImage(_imgUrl),
          radius: 75,
        )),
      ],
    ));
  }
}
