import 'dart:convert';

List<VrShow> vrShowFromJson(String str) => List<VrShow>.from(json.decode(str).map((x) => VrShow.fromJson(x)));
String vrShowToJson(List<VrShow> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VrShow {
  String category;
  String lendingName;
  String organizerName;
  String shortUrl;
  String image;
  String categoryEn;
  String lendingNameEn;
  String organizerNameEn;

  VrShow({
    required this.category,
    required this.lendingName,
    required this.organizerName,
    required this.shortUrl,
    required this.image,
    required this.categoryEn,
    required this.lendingNameEn,
    required this.organizerNameEn,
  });

  factory VrShow.fromJson(Map<String, dynamic> json) => VrShow(
    category: json["category"],
    lendingName: json["lending_name"],
    organizerName: json["organizer_name"],
    shortUrl: json["short_url"],
    image: json["image"],
    categoryEn: json["category_en"],
    lendingNameEn: json["lending_name_en"],
    organizerNameEn: json["organizer_name_en"],
  );

  Map<String, dynamic> toJson() => {
    "category": category,
    "lending_name": lendingName,
    "organizer_name": organizerName,
    "short_url": shortUrl,
    "image": image,
    "category_en": categoryEn,
    "lending_name_en": lendingNameEn,
    "organizer_name_en": organizerNameEn,
  };
}
