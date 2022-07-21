import 'dart:convert';

import 'package:flutter/material.dart';

import 'models/car.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({Key? key}) : super(key: key);

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  String _title = "Local Json İşlemleri";

  Future<List<Car>>? _fillTheList;

  @override
  void initState() {
    super.initState();
    _fillTheList = carsJsonRead(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              debugPrint("buton tıklandı");
              _title = "Buton tıklandı";
            });
          },
        ),
        appBar: AppBar(
          title: Text(_title),
          centerTitle: true,
        ),
        body: FutureBuilder<List<Car>>(
          future: _fillTheList,
          initialData: [
            Car(
                brand: "aaa",
                country: "aaa",
                foundationYear: 1234,
                model: [Model(modelName: "aaa", price: 100, gasoline: true)])
          ],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var carList = snapshot.data;
              return ListView.builder(
                  itemCount: carList!.length,
                  itemBuilder: (context, index) {
                    Car currentCar = carList[index];
                    return Card(
                      child: ListTile(
                        title: Text(currentCar.brand),
                        subtitle: Text(currentCar.foundationYear.toString()),
                        leading: CircleAvatar(
                            child: Text(currentCar.model[0].price.toString())),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  Future<List<Car>> carsJsonRead(BuildContext context) async {
    try {
      debugPrint("5 saniyelik işlem başlıyor.");
      await Future.delayed(Duration(seconds: 5), () {
        debugPrint("5 saniyelik işlem bitti.");
      });
      String readString = await DefaultAssetBundle.of(context)
          .loadString("assets/data/cars.json");
      // debugPrint(readString);
      // debugPrint("************************");

      /*List<Car> carList = jsonDecode(readString);
  debugPrint(carList[1]["model"][0]["model_name"].toString());*/

      var jsonObject = jsonDecode(readString);

      // debugPrint((jsonObject as List).toString());
      // debugPrint(readString);

      List<Car> allCars = (jsonObject as List).map((e) {
        return Car.fromMap(e);
      }).toList();
      return allCars;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
