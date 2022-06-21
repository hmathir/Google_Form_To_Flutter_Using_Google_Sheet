// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

List<DataModel> dataModelFromJson(String str) => List<DataModel>.from(json.decode(str).map((x) => DataModel.fromJson(x)));

String dataModelToJson(List<DataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataModel {
  DataModel({
    required this.timestamp,
    required this.image,
    required this.name,
    required this.number,
    required this.email,
    required this.address,
  });

  dynamic timestamp;
  dynamic image;
  dynamic name;
  dynamic number;
  dynamic email;
  dynamic address;

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    timestamp: json["timestamp"],
    image: json["image"],
    name: json["name"],
    number: json["number"],
    email: json["email"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp,
    "image": image,
    "name": name,
    "number": number,
    "email": email,
    "address": address,
  };
}
