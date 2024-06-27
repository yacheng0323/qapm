import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qapm_platform_interface.dart';

/// An implementation of [QapmPlatform] that uses method channels.
class MethodChannelQapm extends QapmPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qapm_channel');

  // @override
  // Future<String?> getPlatformVersion() async {
  //   final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
  //   return version;
  // }

  // @override
  // Future<dynamic> initialize() async {
  //   final initcode = await methodChannel.invokeMethod<String>("qapm",confi);
  //   return initcode;
  // }
  @override
  Future<dynamic> initialize(Map<String, dynamic> config) async {
    final initcode = await methodChannel.invokeMethod<String>("qapm", config);
    return initcode;
  }
  
}
