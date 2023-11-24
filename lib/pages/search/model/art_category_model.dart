import 'dart:convert';

List<ArtCategory> artCategoryFromJson(String str) => List<ArtCategory>.from(json.decode(str).map((x) => ArtCategory.fromJson(x)));

String artCategoryToJson(List<ArtCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtCategory {
  String index;
  String type;
  String id;
  dynamic score;
  Source source;
  List<String> sort;

  ArtCategory({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
    required this.sort,
  });

  factory ArtCategory.fromJson(Map<String, dynamic> json) => ArtCategory(
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
  String opt;
  String etc;
  int price;
  String sortdate;
  String nickname;
  double width;
  String id;
  String email;
  String gubun;
  double height;

  Source({
    required this.date,
    required this.opt,
    required this.etc,
    required this.price,
    required this.sortdate,
    required this.nickname,
    required this.width,
    required this.id,
    required this.email,
    required this.gubun,
    required this.height,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    date: json["date"],
    opt: json["opt"],
    etc: json["etc"],
    price: json["price"],
    sortdate: json["sortdate"],
    nickname: json["nickname"],
    width: json["width"]?.toDouble(),
    id: json["id"],
    email: json["email"],
    gubun: json["gubun"],
    height: json["height"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "opt": opt,
    "etc": etc,
    "price": price,
    "sortdate": sortdate,
    "nickname": nickname,
    "width": width,
    "id": id,
    "email": email,
    "gubun": gubun,
    "height": height,
  };
}
