import 'dart:convert';

List<ArtInArt> artInArtFromJson(String str) => List<ArtInArt>.from(json.decode(str).map((x) => ArtInArt.fromJson(x)));

//String artInArtToJson(List<ArtInArt> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ArtInArt {
  String dockey;
  String email;
  // Id? id;
  // String? artArtist;
  // String? artYutube;
  // String? artThema;
  // String? artType;
  // String? artColor;
  // bool? artCk1;
  // bool? artCk2;
  // String? artTitle;
  // String? artDate;
  // String? artGenre;
  // String? artGenreEtc;
  // String? artSource;
  // String? artSourceEtc;
  // String? artFrame;
  // String? artWidth;
  // String? artHeight;
  // int? artHosu;
  // String? artExpress;
  // String? artTag;
  // String? artSale;
  // int? artPrice;
  // String? artDateYear;
  // String? nickname;
  // String? realArtistEmail;
  // String? artCuratorExpress;
  // int? fileWidth;
  // int? fileHeight;
  // int? fileSize;
  // String? fileType;
  // int? fileDpi;
  // String? md5Value;
  // String? status;
  // List<Subfile>? subfile;
  // String? artImgFilename;
  // String? mp3Md5;
  // String? mp4Md5;
  // String? artMp3Filename;
  // String? artMp4Filename;
  // int? shippingFee;
  // String? shippingType;
  // ShippingTypeEtc? shippingTypeEtc;
  // String? dockey;
  // int? version;
  // String? email;
  // String? sortdate;
  // String? shortUrl;
  // String? artkey;
  // int? random;
  // String? summary;
  // int? viewcount;
  // Vrinfo? vrinfo;
  // String? mode;
  // String? isSales;
  // List<Favorite>? favorite;

  ArtInArt({
    required this.dockey,
    required this.email,
    //  this.id,
    //  this.artArtist,
    //  this.artYutube,
    //  this.artThema,
    //  this.artType,
    //  this.artColor,
    //  this.artCk1,
    //  this.artCk2,
    //  this.artTitle,
    //  this.artDate,
    //  this.artGenre,
    //  this.artGenreEtc,
    //  this.artSource,
    //  this.artSourceEtc,
    //  this.artFrame,
    //  this.artWidth,
    //  this.artHeight,
    //  this.artHosu,
    //  this.artExpress,
    //  this.artTag,
    //  this.artSale,
    //  this.artPrice,
    //  this.artDateYear,
    //  this.nickname,
    //  this.realArtistEmail,
    //  this.artCuratorExpress,
    //  this.fileWidth,
    //  this.fileHeight,
    //  this.fileSize,
    //  this.fileType,
    //  this.fileDpi,
    //  this.md5Value,
    //  this.status,
    //  this.subfile,
    //  this.artImgFilename,
    //  this.mp3Md5,
    //  this.mp4Md5,
    //  this.artMp3Filename,
    //  this.artMp4Filename,
    //  this.shippingFee,
    //  this.shippingType,
    //  this.shippingTypeEtc,
    //  this.dockey,
    //  this.version,
    //  this.email,
    //  this.sortdate,
    //  this.shortUrl,
    //  this.artkey,
    //  this.random,
    // this.summary,
    //  this.viewcount,
    //  this.vrinfo,
    // this.mode,
    // this.isSales,
    // this.favorite,
  });

  factory ArtInArt.fromJson(Map<String, dynamic> json) => ArtInArt(
    dockey: json['dockey'],
    email: json['email'],
    // id: Id.fromJson(json["_id"]),
    // artArtist: json["art_artist"],
    // artYutube: json["art_yutube"],
    // artThema: json["art_thema"],
    // artType: json["art_type"],
    // artColor: json["art_color"],
    // artCk1: json["art_ck1"],
    // artCk2: json["art_ck2"],
    // artTitle: json["art_title"],
    // artDate: json["art_date"],
    // artGenre: json["art_genre"] ?? "",
    // artGenreEtc: json["art_genre_etc"],
    // artSource: json["art_source"],
    // artSourceEtc: json["art_source_etc"],
    // artFrame: json["art_frame"],
    // artWidth: json["art_width"],
    // artHeight: json["art_height"],
    // artHosu: json["art_hosu"],
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
    // subfile: List<Subfile>.from(json["subfile"].map((x) => Subfile.fromJson(x))),
    // artImgFilename: json["art_img_filename"],
    // mp3Md5: json["mp3_md5"],
    // mp4Md5: json["mp4_md5"],
    // artMp3Filename: json["art_mp3_filename"],
    // artMp4Filename: json["art_mp4_filename"],
    // shippingFee: json["shipping_fee"],
    // shippingType: json["shipping_type"],
    // shippingTypeEtc: ShippingTypeEtc.fromJson(json["shipping_type_etc"]),
    // dockey: json["dockey"],
    // version: json["version"],
    // email: json["email"],
    // sortdate: json["sortdate"],
    // shortUrl: json["short_url"],
    // artkey: json["artkey"],
    // random: json["random"],
    // summary: json["summary"],
    // viewcount: json["viewcount"],
    // vrinfo: Vrinfo.fromJson(json["vrinfo"]),
    // mode: json["mode"],
    // isSales: json["isSales"],
    // favorite: json["favorite"] == null ? [] : List<Favorite>.from(json["favorite"]!.map((x) => Favorite.fromJson(x))),
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
  //   "art_genre_etc": artGenreEtcValues.reverse[artGenreEtc],
  //   "art_source": artSourceValues.reverse[artSource],
  //   "art_source_etc": artSourceEtc,
  //   "art_frame": artFrameValues.reverse[artFrame],
  //   "art_width": artWidth,
  //   "art_height": artHeight,
  //   "art_hosu": artHosu,
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
  //   "subfile": List<dynamic>.from(subfile.map((x) => x.toJson())),
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
  //   "random": random,
  //   "summary": summary,
  //   "viewcount": viewcount,
  //   "vrinfo": vrinfo.toJson(),
  //   "mode": mode,
  //   "isSales": isSales,
  //   "favorite": favorite == null ? [] : List<dynamic>.from(favorite!.map((x) => x.toJson())),
  // };
}
//
// enum ArtArtist {
//   NONAME
// }
//
// final artArtistValues = EnumValues({
//   "NONAME": ArtArtist.NONAME
// });
//
// enum ArtFrame {
//   ART_FRAME,
//   EMPTY
// }
//
// final artFrameValues = EnumValues({
//   "없음": ArtFrame.ART_FRAME,
//   "": ArtFrame.EMPTY
// });
//
// enum ArtGenre {
//   EMPTY
// }
//
// final artGenreValues = EnumValues({
//   "기타": ArtGenre.EMPTY
// });
//
// enum ArtGenreEtc {
//   ART_GENRE_ETC,
//   EMPTY
// }
//
// final artGenreEtcValues = EnumValues({
//   "미디어콜라주": ArtGenreEtc.ART_GENRE_ETC,
//   "미디어아트": ArtGenreEtc.EMPTY
// });
//
// enum ArtSale {
//   RADIO1
// }
//
// final artSaleValues = EnumValues({
//   "radio1": ArtSale.RADIO1
// });
//
// enum ArtSource {
//   EMPTY
// }
//
// final artSourceValues = EnumValues({
//   "캔버스": ArtSource.EMPTY
// });
//
// enum ArtThema {
//   ART_THEMA,
//   EMPTY,
//   PURPLE
// }
//
// final artThemaValues = EnumValues({
//   "풍경 인물 추상": ArtThema.ART_THEMA,
//   "풍경 인물 추상 팝아트": ArtThema.EMPTY,
//   "추상": ArtThema.PURPLE
// });
//
// enum Email {
//   KUNHUNSOO1659_NAVER_COM
// }
//
// final emailValues = EnumValues({
//   "kunhunsoo1659@naver.com": Email.KUNHUNSOO1659_NAVER_COM
// });
//
// class Favorite {
//   String owner;
//
//   Favorite({
//     required this.owner,
//   });
//
//   factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
//     owner: json["owner"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "owner": owner,
//   };
// }
//
// enum FileType {
//   IMAGE_JPEG
// }
//
// final fileTypeValues = EnumValues({
//   "image/jpeg": FileType.IMAGE_JPEG
// });
//
// class Id {
//   String oid;
//
//   Id({
//     required this.oid,
//   });
//
//   factory Id.fromJson(Map<String, dynamic> json) => Id(
//     oid: json["\u0024oid"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "\u0024oid": oid,
//   };
// }
//
// enum ShippingType {
//   EMPTY
// }
//
// final shippingTypeValues = EnumValues({
//   "개별발송": ShippingType.EMPTY
// });
//
// class ShippingTypeEtc {
//   ShippingTypeEtc();
//
//   factory ShippingTypeEtc.fromJson(Map<String, dynamic> json) => ShippingTypeEtc(
//   );
//
//   Map<String, dynamic> toJson() => {
//   };
// }
//
// class Subfile {
//   String filename;
//   int fileWidth;
//   int fileHeight;
//   int fileSize;
//   FileType fileType;
//   String md5Value;
//
//   Subfile({
//     required this.filename,
//     required this.fileWidth,
//     required this.fileHeight,
//     required this.fileSize,
//     required this.fileType,
//     required this.md5Value,
//   });
//
//   factory Subfile.fromJson(Map<String, dynamic> json) => Subfile(
//     filename: json["filename"],
//     fileWidth: json["file_width"],
//     fileHeight: json["file_height"],
//     fileSize: json["file_size"],
//     fileType: fileTypeValues.map[json["file_type"]]!,
//     md5Value: json["MD5Value"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "filename": filename,
//     "file_width": fileWidth,
//     "file_height": fileHeight,
//     "file_size": fileSize,
//     "file_type": fileTypeValues.reverse[fileType],
//     "MD5Value": md5Value,
//   };
// }
//
// class Vrinfo {
//   Templatecode templatecode;
//   Title title;
//   Dockey dockey;
//
//   Vrinfo({
//     required this.templatecode,
//     required this.title,
//     required this.dockey,
//   });
//
//   factory Vrinfo.fromJson(Map<String, dynamic> json) => Vrinfo(
//     templatecode: templatecodeValues.map[json["templatecode"]]!,
//     title: titleValues.map[json["title"]]!,
//     dockey: dockeyValues.map[json["dockey"]]!,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "templatecode": templatecodeValues.reverse[templatecode],
//     "title": titleValues.reverse[title],
//     "dockey": dockeyValues.reverse[dockey],
//   };
// }
//
// enum Dockey {
//   KUNHUNSOO1659_NAVER_COM_20201105175433_AQXEUPZ
// }
//
// final dockeyValues = EnumValues({
//   "kunhunsoo1659@naver.com_20201105175433_AQXEUPZ": Dockey.KUNHUNSOO1659_NAVER_COM_20201105175433_AQXEUPZ
// });
//
// enum Templatecode {
//   S2
// }
//
// final templatecodeValues = EnumValues({
//   "s2": Templatecode.S2
// });
//
// enum Title {
//   EMPTY
// }
//
// final titleValues = EnumValues({
//   "원": Title.EMPTY
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
