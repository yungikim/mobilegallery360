
import 'package:intl/intl.dart';

class Util{
  static String chageText(String str){
    return str.replaceAll("&#40;", "(")
        .replaceAll("&#41;", ")")
        .replaceAll("&#39;", "'")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">");
  }

  static String makeMainArtListURL(String email, String artImgFilename){
    return "https://www.gallery360.co.kr/artimage/${email}/art/preview/${artImgFilename}.jpg";
  }

  static String addComma(double price){
    var f = NumberFormat('###,###,###,###');
    return f.format(price);
  }

  static String addComma2(int price){
    var f = NumberFormat('###,###,###,###');
    return f.format(price);
  }

  static void WLine(){
    print("=============================================================");
  }
}