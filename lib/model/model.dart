// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  int count;
  String name;
  int age;

  Welcome({
    required this.count,
    required this.name,
    required this.age,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    count: json["count"],
    name: json["name"],
    age: json["age"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "name": name,
    "age": age,
  };
}
