import 'dart:convert';

List<NewsCategory> newCategoryFromJson(String str) => List<NewsCategory>.from(json.decode(str).map((x) => NewsCategory.fromJson(x)));

String newCategoryToJson(List<NewsCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsCategory {
  String index;
  String type;
  String id;
  dynamic score;
  Source source;
  List<String> sort;

  NewsCategory({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
    required this.sort,
  });

  factory NewsCategory.fromJson(Map<String, dynamic> json) => NewsCategory(
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
  String summary;
  String etc;
  String sortdate;
  String bun;
  String email;
  String gubun;

  Source({
    required this.date,
    required this.summary,
    required this.etc,
    required this.sortdate,
    required this.bun,
    required this.email,
    required this.gubun,
  });

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    date: json["date"],
    summary: json["summary"],
    etc: json["etc"],
    sortdate: json["sortdate"],
    bun: json["bun"],
    email: json["email"],
    gubun: json["gubun"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "summary": summary,
    "etc": etc,
    "sortdate": sortdate,
    "bun": bun,
    "email": email,
    "gubun": gubun,
  };
}
