import 'package:flutter/material.dart';

class OtherFormItems extends StatefulWidget {
  OtherFormItems({Key? key}) : super(key: key);

  @override
  State<OtherFormItems> createState() => _OtherFormItemsState();
}

class _OtherFormItemsState extends State<OtherFormItems> {
  bool checkBoxState = false;
  bool switchBoolValue = false;
  String sehir = "";
  double sliderValue = 10;
  String? chosenColor;
  List<String> cities = ["Ankara", "İzmir", "Bursa", "Hatay"];
  String? chosenCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.plus_one_rounded),
      ),
      appBar: AppBar(title: Text("Other Form Items")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(children: [
          CheckboxListTile(
            value: checkBoxState,
            onChanged: (deger) {
              checkBoxState = deger!;
              setState(() {});
            },
            activeColor: Colors.red,
            title: Text("Checkbox Title"),
            subtitle: Text("Checkbox Subtitle"),
            secondary: Icon(Icons.add),
            selected: checkBoxState,
          ),
          RadioListTile<String?>(
            value: "Ankara",
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("Seçilen değer: $deger");
              });
            },
            title: Text("Ankara"),
          ),
          RadioListTile<String?>(
            value: "İzmir",
            groupValue: sehir,
            onChanged: (deger) {
              setState(() {
                sehir = deger!;
                debugPrint("Seçilen değer: $deger");
              });
            },
            title: Text("İzmir"),
            subtitle: Text("Radio Subtitle"),
            secondary: Icon(Icons.rocket),
          ),
          RadioListTile<String?>(
              value: "Bursa",
              groupValue: sehir,
              onChanged: (deger) {
                setState(() {
                  sehir = deger!;
                  debugPrint("Seçilen değer: $deger");
                });
              },
              title: Text("Bursa")),
          SwitchListTile(
            value: switchBoolValue,
            onChanged: (deger) {
              setState(() {
                debugPrint("Anlaşma onaylandı: $deger");
                switchBoolValue = deger;
              });
            },
            title: Text("Switch Title"),
            subtitle: Text("Switch Subtitle"),
            secondary: Icon(Icons.refresh),
          ),
          Text("Değeri sliderdan seçiniz."),
          Slider(
            value: sliderValue,
            onChanged: (deger) {
              setState(() {
                sliderValue = deger;
              });
            },
            label: sliderValue.toString(),
            min: 10,
            max: 20,
            divisions: 10,
          ),
          DropdownButton<String>(
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(child: Icon(Icons.circle, color: Colors.red), margin: EdgeInsets.only(right: 10),),
                      Text("Kırmızı")
                    ],
                  ),
                  value: "Kırmızı",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(child: Icon(Icons.circle, color: Colors.blue), margin: EdgeInsets.only(right: 10),),
                      Text("Mavi")
                    ],
                  ),
                  value: "Mavi",
                ),
                DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      Container(child: Icon(Icons.circle, color: Colors.green), margin: EdgeInsets.only(right: 10),),
                      Text("Yeşil")
                    ],
                  ),
                  value: "Yeşil",
                )
              ],
              onChanged: (deger) {
                setState(() {
                  chosenColor = deger;
                  debugPrint(deger);
                });
              }, hint: Text("Seçiniz."), value: chosenColor, ),
              DropdownButton<String>(items: cities.map((e) => DropdownMenuItem<String>(child: Text(e), value: e)).toList(), onChanged: (deger){
                setState(() {
                  chosenCity = deger;
                });
              }, value: chosenCity, hint: Text("Seçiniz"))
        ]),
      ),
    );
  }
}
