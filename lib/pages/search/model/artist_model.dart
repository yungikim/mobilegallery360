import 'dart:convert';

List<ArtistModel> artistModelFromJson(String str) => List<ArtistModel>.from(json.decode(str).map((x) => ArtistModel.fromJson(x)));

String artistModelToJson(List<ArtistModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistModel {
  String index;
  String type;
  String id;
  double score;
  Source source;

  ArtistModel({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
  });

  factory ArtistModel.fromJson(Map<String, dynamic> json) => ArtistModel(
    index: json["_index"],
    type: json["_type"],
    id: json["_id"],
    score: json["_score"]?.toDouble(),
    source: Source.fromJson(json["_source"]),
  );

  Map<String, dynamic> toJson() => {
    "_index": index,
    "_type": type,
    "_id": id,
    "_score": score,
    "_source": source.toJson(),
  };
}

class Source {
  String date;
  String nameEng;
  String etc;
  String sortdate;
  String nickname;
  String name;
  String birth;
  String id;
  String email;
  String gubun;

  Source({
    required this.date,
    required this.nameEng,
    required this.etc,
    required this.sortdate,
    required this.nickname,
    required this.name,
    required this.birth,
    required this.id,
    required this.email,
    required this.gubun,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    date: json["date"],
    nameEng: json["name_eng"],
    etc: json["etc"],
    sortdate: json["sortdate"],
    nickname: json["nickname"],
    name: json["name"],
    birth: json["birth"],
    id: json["id"],
    email: json["email"],
    gubun: json["gubun"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "name_eng": nameEng,
    "etc": etc,
    "sortdate": sortdate,
    "nickname": nickname,
    "name": name,
    "birth": birth,
    "id": id,
    "email": email,
    "gubun": gubun,
  };
}
