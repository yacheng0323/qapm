
import 'qapm_platform_interface.dart';

class Qapm {
  Future<dynamic> qapmInitialize(Map<String, dynamic> config) {
    return QapmPlatform.instance.initialize(config);
  }

  Future<String?> customEvent(
      String category, Map<String, String> tags, Map<String, int> values) {
    return QapmPlatform.instance.customEvent(category, tags, values);
  }
}
