
class Util{
  static String chageText(String str){
    return str.replaceAll("&#40;", "(").replaceAll("&#41;", ")");
  }
}