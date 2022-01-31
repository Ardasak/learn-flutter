import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key}) : super(key: key);
  final _imgUrl = "https://i.ytimg.com/vi/xEuX6HCUFWI/maxresdefault.jpg";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                      color: Colors.red,
                      child: Image.asset(
                        "assets/images/ege.jpeg",
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Container(
                      color: Colors.red,
                      child: Image.network(
                        _imgUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Expanded(
                  child: Container(
                      child: CircleAvatar(
                    backgroundImage: NetworkImage(_imgUrl),
                  )),
                ),
              ],
            ),
          ),
        Container(
          height: 200,
          child: FadeInImage.assetNetwork(
            fit: BoxFit.cover,
            placeholder: "assets/images/loading.gif", 
            image: _imgUrl
          )
        ),
        Expanded(
          child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Placeholder(color: Colors.red,),
        )),
      ],
    ));
  }
}
