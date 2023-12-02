import 'dart:convert';

VrDetailFirst vrDetailFirstFromJson(String str) => VrDetailFirst.fromJson(json.decode(str));

String vrDetailFirstToJson(VrDetailFirst data) => json.encode(data.toJson());

class VrDetailFirst {
  String? roomkey;
  String? bgmusic;
  String? title;
  String? express;
  int? read;
  int? like;
  List<Imagelist>? imagelist;
  String? email;
  String? dockey;
  String? sortdate;
  DateTime? date;
  String? nickname;
  String? gubun;
  String? shortUrl;
  String? show;
  int? random;
  String? changekey;
  String? mode;

  VrDetailFirst({
    this.roomkey,
    this.bgmusic,
    this.title,
    this.express,
    this.read,
    this.like,
    this.imagelist,
    this.email,
    this.dockey,
    this.sortdate,
    this.date,
    this.nickname,
    this.gubun,
    this.shortUrl,
    this.show,
    this.random,
    this.changekey,
    this.mode,
  });

  factory VrDetailFirst.fromJson(Map<String, dynamic> json) => VrDetailFirst(
    roomkey: json["roomkey"],
    bgmusic: json["bgmusic"],
    title: json["title"],
    express: json["express"],
    read: json["read"],
    like: json["like"],
    imagelist: List<Imagelist>.from(json["imagelist"].map((x) => Imagelist.fromJson(x))),
    email: json["email"],
    dockey: json["dockey"],
    sortdate: json["sortdate"],
    date: DateTime.parse(json["date"]),
    nickname: json["nickname"],
    gubun: json["gubun"],
    shortUrl: json["short_url"],
    show: json["show"],
    random: json["random"],
    changekey: json["changekey"],
    mode: json["mode"],
  );

  Map<String, dynamic> toJson() => {
    "roomkey": roomkey,
    "bgmusic": bgmusic,
    "title": title,
    "express": express,
    "read": read,
    "like": like,
    "imagelist": List<dynamic>.from(imagelist!.map((x) => x.toJson())),
    "email": email,
    "dockey": dockey,
    "sortdate": sortdate,
    "date": date?.toIso8601String(),
    "nickname": nickname,
    "gubun": gubun,
    "short_url": shortUrl,
    "show": show,
    "random": random,
    "changekey": changekey,
    "mode": mode,
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

class Imagelist {
  String filekey;
  String ath;
  String name;
  int width;
  int height;
  int oriWidth;
  double oriLeft;
  double oriTop;
  double ox;
  double oy;

  Imagelist({
    required this.filekey,
    required this.ath,
    required this.name,
    required this.width,
    required this.height,
    required this.oriWidth,
    required this.oriLeft,
    required this.oriTop,
    required this.ox,
    required this.oy,
  });

  factory Imagelist.fromJson(Map<String, dynamic> json) => Imagelist(
    filekey: json["filekey"],
    ath: json["ath"],
    name: json["name"],
    width: json["width"],
    height: json["height"],
    oriWidth: json["oriWidth"],
    oriLeft: json["oriLeft"]?.toDouble(),
    oriTop: json["oriTop"]?.toDouble(),
    ox: json["ox"]?.toDouble(),
    oy: json["oy"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "filekey": filekey,
    "ath": ath,
    "name": name,
    "width": width,
    "height": height,
    "oriWidth": oriWidth,
    "oriLeft": oriLeft,
    "oriTop": oriTop,
    "ox": ox,
    "oy": oy,
  };
}
