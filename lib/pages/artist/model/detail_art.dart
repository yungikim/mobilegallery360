import 'dart:convert';

List<DetailArt> detailArtFromJson(String str) => List<DetailArt>.from(json.decode(str).map((x) => DetailArt.fromJson(x)));
// String detailArtToJson(List<DetailArt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DetailArt {
  Id id;
  String artArtist;
  String art_img_filename;
  String art_title;
  String nickname;
  String art_width;
  String art_height;
  int art_hosu;
  int art_price;
  String isSales;
  Vrinfo? vrinfo;
  String? opt;
  String dockey;
  String email;

  // String artYutube;
  // String artThema;
  // String artType;
  // String artColor;
  // bool artCk1;
  // bool artCk2;
  // String artTitle;
  // String artDate;
  // String artGenre;
  // String artGenreEtc;
  // String artSource;
  // String artSourceEtc;
  // String artFrame;
  // String artWidth;
  // String artHeight;
  // int? artHosu;
  // String? artHeight2;
  // String artExpress;
  // String artTag;
  // String artSale;
  // int artPrice;
  // String artDateYear;
  // String nickname;
  // String realArtistEmail;
  // String artCuratorExpress;
  // int fileWidth;
  // int fileHeight;
  // int fileSize;
  // String fileType;
  // int fileDpi;
  // String md5Value;
  // String status;
  // dynamic subfile;
  // String? artImgFilename;
  // String? mp3Md5;
  // String? mp4Md5;
  // String? artMp3Filename;
  // String? artMp4Filename;
  // int? shippingFee;
  // String? shippingType;
  // String? shippingTypeEtc;
  // String dockey;
  // int version;
  // String email;
  // String sortdate;
  // String shortUrl;
  // String artkey;
  // int viewcount;
  // String? isSales;
  // int random;
  // String? summary;
  // String? mode;
  // List<Favorite>? favorite;
  // Vrinfo? vrinfo;

  DetailArt({
    required this.id,
    required this.artArtist,
    required this.art_img_filename,
    required this.art_title,
    required this.nickname,
    this.vrinfo,
    required this.art_height,
    required this.art_hosu,
    required this.art_price,
    required this.art_width,
    required this.isSales,
    this.opt,
    required this.email,
    required this.dockey

    // required this.artYutube,
    // required this.artThema,
    // required this.artType,
    // required this.artColor,
    // required this.artCk1,
    // required this.artCk2,
    // required this.artTitle,
    // required this.artDate,
    // required this.artGenre,
    // required this.artGenreEtc,
    // required this.artSource,
    // required this.artSourceEtc,
    // required this.artFrame,
    // required this.artWidth,
    // required this.artHeight,
    // required this.artHosu,
    // this.artHeight2,
    // required this.artExpress,
    // required this.artTag,
    // required this.artSale,
    // required this.artPrice,
    // required this.artDateYear,
    // required this.nickname,
    // required this.realArtistEmail,
    // required this.artCuratorExpress,
    // required this.fileWidth,
    // required this.fileHeight,
    // required this.fileSize,
    // required this.fileType,
    // required this.fileDpi,
    // required this.md5Value,
    // required this.status,
    // required this.subfile,
    // required this.artImgFilename,
    // required this.mp3Md5,
    // required this.mp4Md5,
    // required this.artMp3Filename,
    // required this.artMp4Filename,
    // required this.shippingFee,
    // required this.shippingType,
    // required this.shippingTypeEtc,
    // required this.dockey,
    // required this.version,
    // required this.email,
    // required this.sortdate,
    // required this.shortUrl,
    // required this.artkey,
    // required this.viewcount,
    // this.isSales,
    // required this.random,
    // this.summary,
    // this.mode,
    // this.favorite,
    // this.vrinfo,
  });

  factory DetailArt.fromJson(Map<String, dynamic> json) => DetailArt(
    id: Id.fromJson(json["_id"]),
    artArtist: json["art_artist"],
    art_img_filename : json['art_img_filename'],
      art_title : json['art_title'],
      nickname : json['nickname'],
      art_width : json['art_width'],
      art_height : json['art_height'],
      art_hosu : json['art_hosu'],
      art_price : json['art_price'],
      isSales : json['isSales'],
      opt : json['opt'],
      dockey : json['dockey'],
      email : json['email'],
      vrinfo: json["vrinfo"] == null ? null : Vrinfo.fromJson(json["vrinfo"]),

    // artYutube: json["art_yutube"],
    // artThema: json["art_thema"],
    // artType: json["art_type"],
    // artColor: json["art_color"],
    // artCk1: json["art_ck1"],
    // artCk2: json["art_ck2"],
    // artTitle: json["art_title"],
    // artDate: json["art_date"],
    // artGenre: json["art_genre"],
    // artGenreEtc: json["art_genre_etc"],
    // artSource: json["art_source"],
    // artSourceEtc: json["art_source_etc"],
    // artFrame: json["art_frame"],
    // artWidth: json["art_width"],
    // artHeight: json["art_height"],
    // artHosu: json["art_hosu"],
    // artHeight2: json["art_height2"],
    // artExpress: json["art_express"],
    // artTag: json["art_tag"],
    // artSale: json["art_sale"],
    // artPrice: json["art_price"],
    // artDateYear: json["art_date_year"],
    // nickname: json["nickname"],
    // realArtistEmail: json["real_artist_email"],
    // artCuratorExpress: json["art_curator_express"],
    // fileWidth: json["file_width"],
    // fileHeight: json["file_height"],
    // fileSize: json["file_size"],
    // fileType: json["file_type"],
    // fileDpi: json["file_dpi"],
    // md5Value: json["MD5Value"],
    // status: json["status"],
    // subfile: json["subfile"],
    // artImgFilename: json["art_img_filename"],
    // mp3Md5: json["mp3_md5"],
    // mp4Md5: json["mp4_md5"],
    // artMp3Filename: json["art_mp3_filename"],
    // artMp4Filename: json["art_mp4_filename"],
    // shippingFee: json["shipping_fee"],
    // shippingType: json["shipping_type"],
    // shippingTypeEtc: json["shipping_type_etc"],
    // dockey: json["dockey"],
    // version: json["version"],
    // email: json["email"],
    // sortdate: json["sortdate"],
    // shortUrl: json["short_url"],
    // artkey: json["artkey"],
    // viewcount: json["viewcount"],
    // isSales: json["isSales"],
    // random: json["random"],
    // summary: json["summary"],
    // mode: json["mode"],
    // favorite: json["favorite"] == null ? [] : List<Favorite>.from(json["favorite"]!.map((x) => Favorite.fromJson(x))),
    // vrinfo: json["vrinfo"] == null ? null : Vrinfo.fromJson(json["vrinfo"]),
  );

  // Map<String, dynamic> toJson() => {
  //   "_id": id.toJson(),
  //   "art_artist": artArtistValues.reverse[artArtist],
  //   "art_yutube": artYutube,
  //   "art_thema": artThemaValues.reverse[artThema],
  //   "art_type": artType,
  //   "art_color": artColor,
  //   "art_ck1": artCk1,
  //   "art_ck2": artCk2,
  //   "art_title": artTitle,
  //   "art_date": artDate,
  //   "art_genre": artGenreValues.reverse[artGenre],
  //   "art_genre_etc": artGenreEtc,
  //   "art_source": artSourceValues.reverse[artSource],
  //   "art_source_etc": artSourceEtcValues.reverse[artSourceEtc],
  //   "art_frame": artFrameValues.reverse[artFrame],
  //   "art_width": artWidth,
  //   "art_height": artHeight,
  //   "art_hosu": artHosu,
  //   "art_height2": artHeight2,
  //   "art_express": artExpress,
  //   "art_tag": artTag,
  //   "art_sale": artSaleValues.reverse[artSale],
  //   "art_price": artPrice,
  //   "art_date_year": artDateYear,
  //   "nickname": artArtistValues.reverse[nickname],
  //   "real_artist_email": realArtistEmail,
  //   "art_curator_express": artCuratorExpress,
  //   "file_width": fileWidth,
  //   "file_height": fileHeight,
  //   "file_size": fileSize,
  //   "file_type": fileTypeValues.reverse[fileType],
  //   "file_dpi": fileDpi,
  //   "MD5Value": md5Value,
  //   "status": status,
  //   "subfile": subfile,
  //   "art_img_filename": artImgFilename,
  //   "mp3_md5": mp3Md5,
  //   "mp4_md5": mp4Md5,
  //   "art_mp3_filename": artMp3Filename,
  //   "art_mp4_filename": artMp4Filename,
  //   "shipping_fee": shippingFee,
  //   "shipping_type": shippingTypeValues.reverse[shippingType],
  //   "shipping_type_etc": shippingTypeEtc.toJson(),
  //   "dockey": dockey,
  //   "version": version,
  //   "email": emailValues.reverse[email],
  //   "sortdate": sortdate,
  //   "short_url": shortUrl,
  //   "artkey": artkey,
  //   "viewcount": viewcount,
  //   "isSales": isSales,
  //   "random": random,
  //   "summary": summary,
  //   "mode": mode,
  //   "favorite": favorite == null ? [] : List<dynamic>.from(favorite!.map((x) => x.toJson())),
  //   "vrinfo": vrinfo?.toJson(),
  // };
}

enum ArtArtist {
  SOIL_ART
}

final artArtistValues = EnumValues({
  "soil art": ArtArtist.SOIL_ART
});

enum ArtFrame {
  ART_FRAME,
  EMPTY
}

final artFrameValues = EnumValues({
  "원목": ArtFrame.ART_FRAME,
  "": ArtFrame.EMPTY
});

enum ArtGenre {
  EMPTY
}

final artGenreValues = EnumValues({
  "회화": ArtGenre.EMPTY
});

enum ArtSale {
  RADIO1
}

final artSaleValues = EnumValues({
  "radio1": ArtSale.RADIO1
});

enum ArtSource {
  ART_SOURCE,
  EMPTY
}

final artSourceValues = EnumValues({
  "캔버스,기타": ArtSource.ART_SOURCE,
  "캔버스": ArtSource.EMPTY
});

enum ArtSourceEtc {
  ART_SOURCE_ETC,
  EMPTY
}

final artSourceEtcValues = EnumValues({
  "흙": ArtSourceEtc.ART_SOURCE_ETC,
  "": ArtSourceEtc.EMPTY
});

enum ArtThema {
  ART_THEMA,
  EMPTY
}

final artThemaValues = EnumValues({
  "": ArtThema.ART_THEMA,
  "추상": ArtThema.EMPTY
});

enum Email {
  WHEHWND0105_NAVER_COM
}

final emailValues = EnumValues({
  "whehwnd0105@naver.com": Email.WHEHWND0105_NAVER_COM
});

class Favorite {
  String owner;

  Favorite({
    required this.owner,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
    owner: json["owner"],
  );

  Map<String, dynamic> toJson() => {
    "owner": owner,
  };
}

enum FileType {
  IMAGE_JPEG
}

final fileTypeValues = EnumValues({
  "image/jpeg": FileType.IMAGE_JPEG
});

class Id {
  String oid;

  Id({
    required this.oid,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    oid: json["\u0024oid"],
  );

  Map<String, dynamic> toJson() => {
    "\u0024oid": oid,
  };
}

enum ShippingType {
  EMPTY
}

final shippingTypeValues = EnumValues({
  "전문배송": ShippingType.EMPTY
});

class ShippingTypeEtc {
  ShippingTypeEtc();

  factory ShippingTypeEtc.fromJson(Map<String, dynamic> json) => ShippingTypeEtc(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Vrinfo {
  String templatecode;
  String title;
  String dockey;

  Vrinfo({
    required this.templatecode,
    required this.title,
    required this.dockey,
  });

  factory Vrinfo.fromJson(Map<String, dynamic> json) => Vrinfo(
    templatecode: json["templatecode"],
    title: json["title"],
    dockey: json["dockey"],
  );

  Map<String, dynamic> toJson() => {
    "templatecode": templatecode,
    "title": title,
    "dockey": dockey,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
