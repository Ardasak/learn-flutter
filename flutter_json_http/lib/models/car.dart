// To parse this JSON data, do
//
//     final car = carFromMap(jsonString);

import 'dart:convert';

Car carFromMap(String str) => Car.fromMap(json.decode(str));

String carToMap(Car data) => json.encode(data.toMap());

class Car {
  Car({
    required this.brand,
    required this.country,
    required this.foundationYear,
    required this.model,
  });

  final String brand;
  final String country;
  final int foundationYear;
  final List<Model> model;

  factory Car.fromMap(Map<String, dynamic> json) => Car(
        brand: json["brand"],
        country: json["country"],
        foundationYear: json["foundation_year"],
        model: List<Model>.from(json["model"].map((x) => Model.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "brand": brand,
        "country": country,
        "foundation_year": foundationYear,
        "model": List<dynamic>.from(model.map((x) => x.toMap())),
      };
}

class Model {
  Model({
    required this.modelName,
    required this.price,
    required this.gasoline,
  });

  final String modelName;
  final int price;
  final bool gasoline;

  factory Model.fromMap(Map<String, dynamic> json) => Model(
        modelName: json["model_name"].toString(),
        price: json["price"],
        gasoline: json["gasoline"],
      );

  Map<String, dynamic> toMap() => {
        "model_name": modelName == null ? null : modelName,
        "price": price,
        "gasoline": gasoline,
      };
}
