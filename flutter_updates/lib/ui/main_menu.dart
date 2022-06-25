import 'package:flutter/material.dart';

import '../models/data.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Data>? allDatas;
  
  @override
  void initState() {
    allDatas = [
      Data("Biz Kimiz", false, "İçerik buraya gelecek."),
      Data("Biz Neredeyiz", false, "İçerik buraya gelecek."),
      Data("Misyonumuz", false, "İçerik buraya gelecek."),
      Data("Vizyonumuz", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
      Data("İletişim", false, "İçerik buraya gelecek."),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
      return ExpansionTile(
        key: PageStorageKey("$index"),
        title: Text(allDatas![index].title), children: [
        Container(
          color: index % 2 == 0 ? Colors.red : Colors.green,
          height: 300,
          width: double.infinity,
          child: Center(child: Text(allDatas![index].content)),
        )
      ],
      initiallyExpanded: allDatas![index].expanded);
    }, itemCount: allDatas!.length,);
  }
}