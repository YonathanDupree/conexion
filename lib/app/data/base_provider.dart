import 'package:get_storage/get_storage.dart';

class BaseProvider {
  GetStorage box = GetStorage();
  late String BASE_URL;

  /*static const BASE_URL_PE   = "servicioweb2per.azzorti.co";
    static const BASE_URL_LIPE = "servicioweb2livper.azzorti.co";*/

  static const BASE_URL_PE = "servicioweb.dupree.pe";
  static const BASE_URL_LIPE = "servicioweb.livva.pe";

  BaseProvider() {
    final lang = box.read("lang");
    if (lang == 'PE') {
      BASE_URL = BASE_URL_PE;
    } else if (lang == 'LIPE') {
      BASE_URL = BASE_URL_LIPE;
    }
  }
}
