// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<NewsModel> newsModelFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newModelToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  String index;
  String type;
  String id;
  double score;
  Source source;

  NewsModel({
    required this.index,
    required this.type,
    required this.id,
    required this.score,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
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
