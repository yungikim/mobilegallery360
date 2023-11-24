import 'dart:convert';

List<ArtistModelSearch> artistModelSearchFromJson(String str) => List<ArtistModelSearch>.from(json.decode(str).map((x) => ArtistModelSearch.fromJson(x)));

String artistModelSearchToJson(List<ArtistModelSearch> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistModelSearch {
  Id id;
  String email;
  String nickname;
  int artCount;
  int vrCount;
  String name;
  String nameEng;
  String photoimageVersion;
  List<Favorite> favorite;
  String? lastArtPath;

  ArtistModelSearch({
    required this.id,
    required this.email,
    required this.nickname,
    required this.artCount,
    required this.vrCount,
    required this.name,
    required this.nameEng,
    required this.photoimageVersion,
    required this.favorite,
    this.lastArtPath,
  });

  factory ArtistModelSearch.fromJson(Map<String, dynamic> json) => ArtistModelSearch(
    id: Id.fromJson(json["_id"]),
    email: json["email"],
    nickname: json["nickname"],
    artCount: json["art_count"],
    vrCount: json["vr_count"],
    name: json["name"],
    nameEng: json["name_eng"],
    photoimageVersion: json["photoimage_version"],
    favorite: List<Favorite>.from(json["favorite"].map((x) => Favorite.fromJson(x))),
    lastArtPath: json["last_art_path"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id.toJson(),
    "email": email,
    "nickname": nickname,
    "art_count": artCount,
    "vr_count": vrCount,
    "name": name,
    "name_eng": nameEng,
    "photoimage_version": photoimageVersion,
    "favorite": List<dynamic>.from(favorite.map((x) => x.toJson())),
    "last_art_path": lastArtPath,
  };
}

class Favorite {
  String owner;

  Favorite({
    required this.owner,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    owner: json["owner"],
  );

  Map<String, dynamic> toJson() => {
    "owner": owner,
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
