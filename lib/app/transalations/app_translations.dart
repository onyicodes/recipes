

import 'package:recipes/app/transalations/en_US/en_us_translation.dart';
import 'package:recipes/app/transalations/es_MX/es_mx_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en_US': enUs,
    'es_mx': esMx
  };
}
