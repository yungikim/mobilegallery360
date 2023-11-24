class ArtistModel {
  String? nickname, name, email, avatar, ename;
  int? artcount, vrcount;

  ArtistModel(
      {this.nickname,
        this.name,
        this.email,
        this.avatar,
        this.ename,
        this.artcount,
        this.vrcount});

  factory ArtistModel.fromJson(Map<String, dynamic> json) {
    return ArtistModel(
      nickname: json['nickname'],
      name: json['name'],
      email: json['email'],
      avatar: json['last_art_path'],
      ename: json['name_eng'],
      artcount: json['art_count'],
      vrcount: json['vr_count'],
    );
  }
}




// import 'dart:convert';
//
// List<ArtistModel> artistModelFromJson(String str) => List<ArtistModel>.from(json.decode(str).map((x) => ArtistModel.fromJson(x)));
//
// String artistModelToJson(List<ArtistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ArtistModel {
//   Id id;
//   String email;
//   String nickname;
//   String name;
//   String sortdate;
//   int artCount;
//   int? vrCount;
//   String nameEng;
//   String? photoimageVersion;
//   String lastArtPath;
//   Myfavorite myfavorite;
//
//   ArtistModel({
//     required this.id,
//     required this.email,
//     required this.nickname,
//     required this.name,
//     required this.sortdate,
//     required this.artCount,
//     this.vrCount,
//     required this.nameEng,
//     this.photoimageVersion,
//     required this.lastArtPath,
//     required this.myfavorite,
//   });
//
//   factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
//     id: Id.fromJson(json["_id"]),
//     email: json["email"],
//     nickname: json["nickname"],
//     name: json["name"],
//     sortdate: json["sortdate"],
//     artCount: json["art_count"],
//     vrCount: json["vr_count"],
//     nameEng: json["name_eng"],
//     photoimageVersion: json["photoimage_version"],
//     lastArtPath: json["last_art_path"],
//     myfavorite: myfavoriteValues.map[json["myfavorite"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "_id": id.toJson(),
//     "email": email,
//     "nickname": nickname,
//     "name": name,
//     "sortdate": sortdate,
//     "art_count": artCount,
//     "vr_count": vrCount,
//     "name_eng": nameEng,
//     "photoimage_version": photoimageVersion,
//     "last_art_path": lastArtPath,
//     "myfavorite": myfavoriteValues.reverse[myfavorite],
//   };
// }
//
// class Id {
//   String oid;
//
//   Id({
//     required this.oid,
//   });
//
//   factory Id.fromJson(Map<String, dynamic> json) => Id(
//     oid: json["\u0024oid"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "\u0024oid": oid,
//   };
// }
//
// enum Myfavorite {
//   F
// }
//
// final myfavoriteValues = EnumValues({
//   "F": Myfavorite.F
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
