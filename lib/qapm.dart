
import 'qapm_platform_interface.dart';

class Qapm {
  Future<String?> getPlatformVersion() {
    return QapmPlatform.instance.getPlatformVersion();
  }
}
