// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<VRCategory> vrCategoryFromJson(String str) => List<VRCategory>.from(json.decode(str).map((x) => VRCategory.fromJson(x)));

String vrCategoryToJson(List<VRCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VRCategory {
  String index;
  String type;
  String id;
  dynamic score;
  Source source;
  List<String> sort;

  VRCategory({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
    required this.sort,
  });

  factory VRCategory.fromJson(Map<String, dynamic> json) => VRCategory(
    index: json["_index"],
    type: json["_type"],
    id: json["_id"],
    score: json["_score"],
    source: Source.fromJson(json["_source"]),
    sort: List<String>.from(json["sort"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_index": index,
    "_type": type,
    "_id": id,
    "_score": score,
    "_source": source.toJson(),
    "sort": List<dynamic>.from(sort.map((x) => x)),
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
