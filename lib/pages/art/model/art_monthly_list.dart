import 'dart:convert';

List<ArtMonth> artMonthFromJson(String str) => List<ArtMonth>.from(json.decode(str).map((x) => ArtMonth.fromJson(x)));

String artMonthToJson(List<ArtMonth> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtMonth {
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
  String dockey;
  int version;
  String email;
  String sortdate;
  Vrinfo? vrinfo;

  ArtMonth({
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
    required this.dockey,
    required this.version,
    required this.email,
    required this.sortdate,
    this.vrinfo,
  });

  factory ArtMonth.fromJson(Map<String, dynamic> json) => ArtMonth(
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
    dockey: json["dockey"],
    version: json["version"],
    email: json["email"],
    sortdate: json["sortdate"],
    vrinfo: json["vrinfo"] == null ? null : Vrinfo.fromJson(json["vrinfo"]),
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
    "dockey": dockey,
    "version": version,
    "email": email,
    "sortdate": sortdate,
    "vrinfo": vrinfo?.toJson(),
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
