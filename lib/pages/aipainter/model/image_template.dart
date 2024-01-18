import 'dart:convert';

List<List<template>> templateJson(String str) => List<List<template>>.from(json.decode(str).map((x) => List<template>.from(x.map((x) => template.fromJson(x)))));

String templateToJson(List<List<template>> data) => json.encode(List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))));

class template {
  Id id;
  String? name;
  int? sort;
  String? artist;
  String? title;
  String? requestUploadImg;
  bool? requestIsSendMail;
  String? requestSelectImg;
  String? requestSendMail;
  String? requestStatus;
  String? email;
  String? sortdate;
  DateTime? date;
  String? dockey;
  int? random;

  template({
    required this.id,
    this.name,
    this.sort,
    this.artist,
    this.title,
    this.requestUploadImg,
    this.requestIsSendMail,
    this.requestSelectImg,
    this.requestSendMail,
    this.requestStatus,
    this.email,
    this.sortdate,
    this.date,
    this.dockey,
    this.random,
  });

  factory template.fromJson(Map<String, dynamic> json) => template(
    id: Id.fromJson(json["_id"]),
    name: json["name"],
    sort: json["sort"],
    artist: json["artist"],
    title: json["title"],
    requestUploadImg: json["request_upload_img"],
    requestIsSendMail: json["request_is_send_mail"],
    requestSelectImg: json["request_select_img"],
    requestSendMail: json["request_send_mail"],
    requestStatus: json["request_status"],
    email: json["email"],
    sortdate: json["sortdate"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dockey: json["dockey"],
    random: json["random"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "name": name,
    "sort": sort,
    "artist": artist,
    "title": title,
    "request_upload_img": requestUploadImg,
    "request_is_send_mail": requestIsSendMail,
    "request_select_img": requestSelectImg,
    "request_send_mail": requestSendMail,
    "request_status": requestStatus,
    "email": email,
    "sortdate": sortdate,
    "date": date?.toIso8601String(),
    "dockey": dockey,
    "random": random,
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
