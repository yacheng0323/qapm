import 'package:flutter_test/flutter_test.dart';
import 'package:qapm/qapm.dart';
import 'package:qapm/qapm_platform_interface.dart';
import 'package:qapm/qapm_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQapmPlatform
    with MockPlatformInterfaceMixin
    implements QapmPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QapmPlatform initialPlatform = QapmPlatform.instance;

  test('$MethodChannelQapm is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQapm>());
  });

  test('getPlatformVersion', () async {
    Qapm qapmPlugin = Qapm();
    MockQapmPlatform fakePlatform = MockQapmPlatform();
    QapmPlatform.instance = fakePlatform;

    expect(await qapmPlugin.getPlatformVersion(), '42');
  });
}
