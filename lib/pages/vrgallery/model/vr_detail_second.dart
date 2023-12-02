import 'dart:convert';

List<VrDetailSecond> vrDetailSecondFromJson(String str) => List<VrDetailSecond>.from(json.decode(str).map((x) => VrDetailSecond.fromJson(x)));

String vrDetailSecondToJson(List<VrDetailSecond> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VrDetailSecond {
  Id id;
  String title;
  int read;
  int like;
  String dockey;
  String sortdate;
  String nickname;
  int favoriteCount;

  VrDetailSecond({
    required this.id,
    required this.title,
    required this.read,
    required this.like,
    required this.dockey,
    required this.sortdate,
    required this.nickname,
    required this.favoriteCount,
  });

  factory VrDetailSecond.fromJson(Map<String, dynamic> json) => VrDetailSecond(
    id: Id.fromJson(json["_id"]),
    title: json["title"],
    read: json["read"],
    like: json["like"],
    dockey: json["dockey"],
    sortdate: json["sortdate"],
    nickname: json["nickname"],
    favoriteCount: json["favorite_count"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "title": title,
    "read": read,
    "like": like,
    "dockey": dockey,
    "sortdate": sortdate,
    "nickname": nickname,
    "favorite_count": favoriteCount,
  };
}

class Id {
  String oid;

  Id({
    required this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    oid: json["\u0024oid"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024oid": oid,
  };
}
