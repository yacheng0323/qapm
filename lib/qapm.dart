
import 'qapm_platform_interface.dart';

class Qapm {
  Future<dynamic> qapmInitialize(Map<String, dynamic> config) {
    return QapmPlatform.instance.initialize(config);
  }
}
