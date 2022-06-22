import 'package:flutter/material.dart';

class CustomFont extends StatelessWidget {
  const CustomFont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
            child: Column(
          children: const [
            Text(
              'Kişisel Font Kullanımı',
              style: TextStyle(fontFamily: 'CustomFont', fontSize: 36),
            ),
            Text(
              'Kişisel Font Kullanımı',
              style: TextStyle(
                  fontFamily: 'CustomFont',
                  fontSize: 36,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Kişisel Font Kullanımı',
              style: TextStyle(fontSize: 36),
            ),
          ],
        ));
  }
}