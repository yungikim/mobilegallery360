
class Util{
  static String chageText(String str){
    return str.replaceAll("&#40;", "(").replaceAll("&#41;", ")").replaceAll("&lt;", "<").replaceAll("&gt;", ">");
  }

  static String makeMainArtListURL(String email, String artImgFilename){
    return "https://www.gallery360.co.kr/artimage/${email}/art/preview/${artImgFilename}.jpg";
  }
}