import 'dart:convert';

List<DetailVR> detailVRFromJson(String str) => List<DetailVR>.from(json.decode(str).map((x) => DetailVR.fromJson(x)));

String detailVRToJson(List<DetailVR> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailVR {
  Id id;
  String title;
  int read;
  int like;
  String dockey;
  String sortdate;
  String nickname;
  int favoriteCount;

  DetailVR({
    required this.id,
    required this.title,
    required this.read,
    required this.like,
    required this.dockey,
    required this.sortdate,
    required this.nickname,
    required this.favoriteCount,
  });

  factory DetailVR.fromJson(Map<String, dynamic> json) => DetailVR(
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
