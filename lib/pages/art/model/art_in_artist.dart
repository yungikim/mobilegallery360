import 'dart:convert';

ArtinArtist artInArtistFromJson(String str) => ArtinArtist.fromJson(json.decode(str));

String artInArtistToJson(ArtinArtist data) => json.encode(data.toJson());

class ArtinArtist {
  String nickname;
  String email;
  String name;
  String content;
  String photoimage;
  String photoimageList;
  String photoimageProfile;
  String birth;
  String gubun;
  String photoimageVersion;

  ArtinArtist({
    required this.nickname,
    required this.email,
    required this.name,
    required this.content,
    required this.photoimage,
    required this.photoimageList,
    required this.photoimageProfile,
    required this.birth,
    required this.gubun,
    required this.photoimageVersion,
  });

  factory ArtinArtist.fromJson(Map<String, dynamic> json) => ArtinArtist(
    nickname: json["nickname"],
    email: json["email"],
    name: json["name"],
    content: json["content"],
    photoimage: json["photoimage"],
    photoimageList: json["photoimage_list"],
    photoimageProfile: json["photoimage_profile"],
    birth: json["birth"],
    gubun: json["gubun"],
    photoimageVersion: json["photoimage_version"],
  );

  Map<String, dynamic> toJson() => {
    "nickname": nickname,
    "email": email,
    "name": name,
    "content": content,
    "photoimage": photoimage,
    "photoimage_list": photoimageList,
    "photoimage_profile": photoimageProfile,
    "birth": birth,
    "gubun": gubun,
    "photoimage_version": photoimageVersion,
  };
}
