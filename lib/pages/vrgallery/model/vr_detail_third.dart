import 'dart:convert';

List<VrDetailThird> vrDetailThirdFromJson(String str) => List<VrDetailThird>.from(json.decode(str).map((x) => VrDetailThird.fromJson(x)));

String vrDetailThirdToJson(List<VrDetailThird> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VrDetailThird {
  String dockey;
  String version;
  String email;

  VrDetailThird({
    required this.dockey,
    required this.version,
    required this.email,
  });

  factory VrDetailThird.fromJson(Map<String, dynamic> json) => VrDetailThird(
    dockey: json["dockey"],
    version: json["version"].toString(),
    email: json["email"],

  );

  Map<String, dynamic> toJson() => {
    "dockey": dockey,
    "version": version,
    "email": email,
  };
}



