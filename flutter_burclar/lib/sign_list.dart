

import 'package:flutter/material.dart';
import 'package:flutter_burclar/data/strings.dart';
import 'package:flutter_burclar/model/sign.dart';
import 'package:flutter_burclar/sign_item.dart';

class SignList extends StatelessWidget {
  late List<Sign> allSigns;

  
  SignList(){
    allSigns = prepareDataSource();
    print(allSigns);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign List"),),
      body: Center(child: ListView.builder(itemBuilder: (context, i){
        return SignItem(listedSign: allSigns[i]);
      }, itemCount: 12,)),
    );
  }
  
  List<Sign> prepareDataSource() {
    List<Sign> temp = [];
    for(int i = 0; i < 12; i++){
      temp.add(Sign(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i], Strings.BURC_GENEL_OZELLIKLERI[i], Strings.BURC_ADLARI[i].toLowerCase() + "${i+1}.png", Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i+1}.png"));
    }
    return temp;
  }
}