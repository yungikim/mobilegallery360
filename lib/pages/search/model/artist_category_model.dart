import 'dart:convert';

List<ArtistCategoryModel> artistCategoryFromJson(String str) => List<ArtistCategoryModel>.from(json.decode(str).map((x) => ArtistCategoryModel.fromJson(x)));

String artistCategoryToJson(List<ArtistCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtistCategoryModel {
  String index;
  String type;
  String id;
  dynamic score;
  Source source;
  List<String> sort;

  ArtistCategoryModel({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
    required this.sort,
  });

  factory ArtistCategoryModel.fromJson(Map<String, dynamic> json) => ArtistCategoryModel(
    index: json["_index"],
    type: json["_type"],
    id: json["_id"],
    score: json["_score"],
    source: Source.fromJson(json["_source"]),
    sort: List<String>.from(json["sort"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_index": index,
    "_type": type,
    "_id": id,
    "_score": score,
    "_source": source.toJson(),
    "sort": List<dynamic>.from(sort.map((x) => x)),
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
