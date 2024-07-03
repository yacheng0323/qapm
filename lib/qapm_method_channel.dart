import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qapm_platform_interface.dart';


class MethodChannelQapm extends QapmPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('qapm_channel');

  @override
  Future<dynamic> initialize(Map<String, dynamic> config) async {
    final initcode = await methodChannel.invokeMethod<String>("qapm", config);
    return initcode;
  }

  @override
  Future<String?> customEvent(String category, Map<String, String> tags,
      Map<String, int> values) async {
    final eventUUID = await methodChannel.invokeMethod<String>(
        "customEvent", {"category": category, "tags": tags, "values": values});
    return eventUUID;
  }
}

