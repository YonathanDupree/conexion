import 'es_BO/es_bo_translations.dart';
import 'es_CO/es_co_translations.dart';
import 'es_EC/es_ec_translations.dart';
import 'es_GU/es_gu_translations.dart';
import 'es_PE/es_pe_translations.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'es_BO': esBO,
    'es_CO': esCO,
    'es_EC': esEC,
    'es_GU': esGU,
    'es_PE': esPE,
    'es_LIPE': esPE,
  };
}
