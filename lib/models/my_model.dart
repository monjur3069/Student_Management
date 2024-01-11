// To parse this JSON data, do
//
//     final myModel = myModelFromJson(jsonString);

import 'dart:convert';

List<MyModel> myModelFromJson(String str) => List<MyModel>.from(json.decode(str).map((x) => MyModel.fromJson(x)));

String myModelToJson(List<MyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  MyModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
