import 'dart:convert';

List<ArtList> artListFromJson(String str) => List<ArtList>.from(json.decode(str).map((x) => ArtList.fromJson(x)));

String artListToJson(List<ArtList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtList {
  Id id;
  String artArtist;
  bool artCk1;
  bool artCk2;
  String artTitle;
  String artWidth;
  String artHeight;
  int? artHosu;
  int artPrice;
  String status;
  String artImgFilename;
  dynamic version;
  String email;
  int? random;
  Vrinfo? vrinfo;
  Myfavorite myfavorite;
  String? opt;

  ArtList({
    required this.id,
    required this.artArtist,
    required this.artCk1,
    required this.artCk2,
    required this.artTitle,
    required this.artWidth,
    required this.artHeight,
    required this.artHosu,
    required this.artPrice,
    required this.status,
    required this.artImgFilename,
    required this.version,
    required this.email,
    this.random,
    this.vrinfo,
    required this.myfavorite,
    this.opt,
  });

  factory ArtList.fromJson(Map<String, dynamic> json) => ArtList(
    id: Id.fromJson(json["_id"]),
    artArtist: json["art_artist"],
    artCk1: json["art_ck1"],
    artCk2: json["art_ck2"],
    artTitle: json["art_title"],
    artWidth: json["art_width"],
    artHeight: json["art_height"],
    artHosu: json["art_hosu"],
    artPrice: json["art_price"],
    status: json["status"],
    artImgFilename: json["art_img_filename"],
    version: json["version"],
    email: json["email"],
    random: json["random"],
    vrinfo: json["vrinfo"] == null ? null : Vrinfo.fromJson(json["vrinfo"]),
    myfavorite: myfavoriteValues.map[json["myfavorite"]]!,
    opt: json["opt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "art_artist": artArtist,
    "art_ck1": artCk1,
    "art_ck2": artCk2,
    "art_title": artTitle,
    "art_width": artWidth,
    "art_height": artHeight,
    "art_hosu": artHosu,
    "art_price": artPrice,
    "status": status,
    "art_img_filename": artImgFilename,
    "version": version,
    "email": email,
    "random": random,
    "vrinfo": vrinfo?.toJson(),
    "myfavorite": myfavoriteValues.reverse[myfavorite],
    "opt": opt,
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

enum Myfavorite {
  F
}

final myfavoriteValues = EnumValues({
  "F": Myfavorite.F
});

class Vrinfo {
  String templatecode;
  String title;
  String dockey;

  Vrinfo({
    required this.templatecode,
    required this.title,
    required this.dockey,
  });

  factory Vrinfo.fromJson(Map<String, dynamic> json) => Vrinfo(
    templatecode: json["templatecode"],
    title: json["title"],
    dockey: json["dockey"],
  );

  Map<String, dynamic> toJson() => {
    "templatecode": templatecode,
    "title": title,
    "dockey": dockey,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
