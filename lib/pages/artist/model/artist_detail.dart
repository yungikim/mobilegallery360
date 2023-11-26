import 'dart:convert';
import 'dart:ui';

ArtistDetail artistDetailFromJson2(String str) =>
    ArtistDetail.fromJson(json.decode(str));

// String userDetailToJson2(UserDetail2 data) => json.encode(data.toJson());

class ArtistDetail {
  String nickname = "";

  // ID id;
  String? email;

  // String? gubun;
  // String? site;
  // String? welcomeId;
  String? name;

  // String? gender;
  // String? sortdate;
  // int? artCount;
  // int? vrCount;
  // String? shortUrl;
  // String? status;
  // String? artistkey;
  // String? emailAuth;
  // int? random;
  String? photoimage;

  // String? photoimageVersion;
  // String? photoimageList;
  // String? photoimageListVersion;
  String? photoimageProfile;

  // String? photoimageProfileVersion;
  String? nameEng;

  // String? birth;
  String? content;
  String? content2;

  // String? curnickname;
  List<Group>? group;
  List<Education>? education;
  List<Career>? career;
  List<Cert>? cert;
  List<Display>? display;

  // String? summary;
  // String? lastArtPath;
  // String? autoupload;
  // String? mode;

  ArtistDetail({
    required this.nickname,
    // required this.id,
    this.email,
    this.name,
    // this.gubun,
    // this.site,
    // this.welcomeId,
    // required this.name,
    //  this.gender,
    //  this.sortdate,
    //  this.artCount,
    //  this.vrCount,
    //  this.shortUrl,
    //  this.status,
    //  this.artistkey,
    //  this.emailAuth,
    //  this.random,
    this.photoimage,
    //  this.photoimageVersion,
    //  this.photoimageList,
    //  this.photoimageListVersion,
    this.photoimageProfile,
    //  this.photoimageProfileVersion,
    this.nameEng,
    //  this.curnickname,
    //  this.birth,
    this.content,
    this.content2,
    this.group,
    this.education,
    this.career,
    this.cert,
    this.display,
    //  this.summary,
    //  this.lastArtPath,
    //  this.autoupload,
    //  this.mode,
  });

  ArtistDetail.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    email = json['email'];
    photoimageProfile = json['photoimage'];
    photoimageProfile = json['photoimage_profile'];
    name = json['name'];
    nameEng = json['name_eng'];
    content = json['content'];
    content2 = json['content2'];
    if (json["group"] != null) {
      group = List<Group>.from(json["group"].map((x) => Group.fromJson(x)));
    }
    if (json["education"] != null) {
      education = List<Education>.from(
          json["education"].map((x) => Education.fromJson(x)));
    }
    if (json["career"] != null) {
      career = List<Career>.from(json["career"].map((x) => Career.fromJson(x)));
    }
    if (json["group"] != null) {
      group = List<Group>.from(json["group"].map((x) => Group.fromJson(x)));
    }

    if (json["cert"] != null) {
      cert = List<Cert>.from(json["cert"].map((x) => Cert.fromJson(x)));
    }

    if (json["display"] != null) {
      display =
          List<Display>.from(json["display"].map((x) => Display.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['email'] = email;
    data['photoimage'] = photoimage;
    data['photoimage_profile'] = photoimageProfile;
    if (group != null) {
      data['group'] = List<dynamic>.from(group!.map((x) => x.toJson()));
    }
    return data;
  }
}

class Career {
  String term;
  String title;

  Career({
    required this.term,
    required this.title,
  });

  factory Career.fromJson(Map<String, dynamic> json) => Career(
        term: json['term'],
        title: json['title'],
      );

  Map<String, dynamic> toJson() => {
        "term": term,
        "title": title,
      };
}

class Cert {
  String certname;

  Cert({
    required this.certname,
  });

  factory Cert.fromJson(Map<String, dynamic> json) => Cert(
        certname: json['certname'],
      );

  Map<String, dynamic> toJson() => {
        "certname": certname,
      };
}

class Education {
  String? level;
  String? status;
  String? schoolname;
  String? major;
  String? start;
  String? end;

  Education({
    this.level,
    this.status,
    this.schoolname,
    this.major,
    this.start,
    this.end,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
        level: json['level'],
        status: json['status'],
        schoolname: json['schoolname'],
        major: json['major'],
        start: json['start'],
        end: json['end'],
      );

  Map<String, dynamic> toJson() => {
        "level": level,
        "status": status,
        "schoolname": schoolname,
        "major": major,
        "start": start,
        "end": end,
      };
}

class Group {
  String title;
  String dept;
  String jobtitle;

  Group({
    required this.title,
    required this.dept,
    required this.jobtitle,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        title: json["title"],
        dept: json['dept'],
        jobtitle: json['jobtitle'],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "dept": dept,
        "jobtitle": jobtitle,
      };
}

class Display {
  String term;
  String title;

  Display({required this.term, required this.title});

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        term: json['term'],
        title: json['title'],
      );
}

class ID {
  String oid;

  ID({
    required this.oid,
  });

  factory ID.fromJson(Map<String, dynamic> json) => ID(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

ArtistDetail EmptyUserDetail2() {
  return ArtistDetail(
    // id: ID(oid: ""),
    // email: "",
    nickname: "",
    // gubun: "",
    // site: "",
    // welcomeId: "",
    // name: "",
  );
}
