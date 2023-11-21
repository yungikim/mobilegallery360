import 'dart:convert';

List<VRModel> vrModelFromJson(String str) => List<VRModel>.from(json.decode(str).map((x) => VRModel.fromJson(x)));
String vrModelToJson(List<VRModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VRModel {
  int? totalcount;
  String? dockey;
  String? email;
  String? like;
  String? nickname;
  String? read;
  String? templatecode;
  String? title;
  String? mode;

  VRModel({
    this.totalcount,
    this.dockey,
    this.email,
    this.like,
    this.nickname,
    this.read,
    this.templatecode,
    this.title,
    this.mode,
  });

  factory VRModel.fromJson(Map<String, dynamic> json) => VRModel(
    totalcount: json["totalcount"],
    dockey: json["dockey"],
    email: json["email"],
    like: json["like"],
    nickname: json["nickname"],
    read: json["read"],
    templatecode: json["templatecode"],
    title: json["title"],
    mode: json["mode"],
  );

  Map<String, dynamic> toJson() => {
    "totalcount": totalcount,
    "dockey": dockey,
    "email": email,
    "like": like,
    "nickname": nickname,
    "read": read,
    "templatecode": templatecode,
    "title": title,
    "mode": mode,
  };
}
