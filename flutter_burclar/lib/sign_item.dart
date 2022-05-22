import 'package:flutter/material.dart';
import 'package:flutter_burclar/model/burc.dart';

import 'burc_detay.dart';

class SignItem extends StatelessWidget {
  final Sign listedSign;
  const SignItem({required this.listedSign, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      child: ListTile(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignDetail(selectedSign: listedSign))),
        leading: Image.asset("images/" + listedSign.signSmallImage, width: 64, height: 64,),
        title: Text(listedSign.signName, style: textStyle.headline6,),
        subtitle: Text(listedSign.signDate, style: textStyle.subtitle2,),
        trailing: Icon(Icons.arrow_forward, color: Colors.pink,),
      ),
    );
  }
}