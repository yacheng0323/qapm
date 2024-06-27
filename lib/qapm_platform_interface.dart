import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qapm_method_channel.dart';

abstract class QapmPlatform extends PlatformInterface {
  /// Constructs a QapmPlatform.
  QapmPlatform() : super(token: _token);

  static final Object _token = Object();

  static QapmPlatform _instance = MethodChannelQapm();

  /// The default instance of [QapmPlatform] to use.
  ///
  /// Defaults to [MethodChannelQapm].
  static QapmPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QapmPlatform] when
  /// they register themselves.
  static set instance(QapmPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  // Future<String?> getPlatformVersion() {
  //   throw UnimplementedError('platformVersion() has not been implemented.');
  // }

  Future<dynamic> initialize(Map<String, dynamic> config) {
    throw UnimplementedError('initialize() has not been implemented.');
  }
}
