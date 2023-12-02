import 'dart:convert';

List<VRListModel> vrListModelFromJson(String str) => List<VRListModel>.from(json.decode(str).map((x) => VRListModel.fromJson(x)));

// String vrModelListToJson(List<VRListMoel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VRListModel {
  Id? id;
  String? title;
  int? read;
  int? like;
  String? dockey;
  String? nickname;
  int? random;
  int? favoriteCount;

  VRListModel({
    this.id,
    this.title,
    this.read,
    this.like,
    this.dockey,
    this.nickname,
    this.random,
    this.favoriteCount,
  });

  factory VRListModel.fromJson(Map<String, dynamic> json) => VRListModel(
    id: Id.fromJson(json["_id"]),
    title: json["title"],
    read: json["read"],
    like: json["like"],
    dockey: json["dockey"],
    nickname: json["nickname"],
    random: json["random"],
    favoriteCount: json["favorite_count"],
  );

  //Map<String, dynamic> toJson() => {
  //   "_id": id.toJson(),
  //   "title": title,
  //   "read": read,
  //   "like": like,
  //   "dockey": dockey,
  //   "nickname": nickname,
  //   "random": random,
  //   "favorite_count": favoriteCount,
  // };
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
