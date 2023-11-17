import 'dart:convert';

List<MonthlyArtist> monthlyArtistFromJson(String str) => List<MonthlyArtist>.from(json.decode(str).map((x) => MonthlyArtist.fromJson(x)));
String monthlyArtistToJson(List<MonthlyArtist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MonthlyArtist {
  Id id;
  String email;
  String nickname;
  String name;
  String sortdate;
  int artCount;
  int vrCount;
  String? photoimageVersion;
  String nameEng;
  String? lastArtPath;

  MonthlyArtist({
    required this.id,
    required this.email,
    required this.nickname,
    required this.name,
    required this.sortdate,
    required this.artCount,
    required this.vrCount,
    this.photoimageVersion,
    required this.nameEng,
    this.lastArtPath,
  });

  factory MonthlyArtist.fromJson(Map<String, dynamic> json) => MonthlyArtist(
    id: Id.fromJson(json["_id"]),
    email: json["email"],
    nickname: json["nickname"],
    name: json["name"],
    sortdate: json["sortdate"],
    artCount: json["art_count"],
    vrCount: json["vr_count"],
    photoimageVersion: json["photoimage_version"],
    nameEng: json["name_eng"],
    lastArtPath: json["last_art_path"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "email": email,
    "nickname": nickname,
    "name": name,
    "sortdate": sortdate,
    "art_count": artCount,
    "vr_count": vrCount,
    "photoimage_version": photoimageVersion,
    "name_eng": nameEng,
    "last_art_path": lastArtPath,
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
