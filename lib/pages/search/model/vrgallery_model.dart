// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<VrGalleryModel> vrgalleryModelFromJson(String str) => List<VrGalleryModel>.from(json.decode(str).map((x) => VrGalleryModel.fromJson(x)));

String vrgalleryModelToJson(List<VrGalleryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VrGalleryModel {
  String index;
  String type;
  String id;
  double score;
  Source source;

  VrGalleryModel({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
  });

  factory VrGalleryModel.fromJson(Map<String, dynamic> json) => VrGalleryModel(
    index: json["_index"],
    type: json["_type"],
    id: json["_id"],
    score: json["_score"]?.toDouble(),
    source: Source.fromJson(json["_source"]),
  );

  Map<String, dynamic> toJson() => {
    "_index": index,
    "_type": type,
    "_id": id,
    "_score": score,
    "_source": source.toJson(),
  };
}

class Source {
  String date;
  String etc;
  String sortdate;
  String nickname;
  String id;
  String email;
  String gubun;

  Source({
    required this.date,
    required this.etc,
    required this.sortdate,
    required this.nickname,
    required this.id,
    required this.email,
    required this.gubun,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    date: json["date"],
    etc: json["etc"],
    sortdate: json["sortdate"],
    nickname: json["nickname"],
    id: json["id"],
    email: json["email"],
    gubun: json["gubun"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "etc": etc,
    "sortdate": sortdate,
    "nickname": nickname,
    "id": id,
    "email": email,
    "gubun": gubun,
  };
}
