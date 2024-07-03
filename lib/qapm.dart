import 'package:flutter/foundation.dart';

import 'qapm_platform_interface.dart';

class Qapm {
  /// 初始化 QAPM
  Future<dynamic> qapmInitialize(Map<String, dynamic> config) {
    return QapmPlatform.instance.initialize(config);
  }

  /// 用户自定义用户行为操作调用,外部用户接口，调用该接口时请完成QAPM的一系列初始化操作，设置完QAPM的appKey后调用。
  ///
  /// @param category  事件名，建议全部用大写字母表示
  /// @param tags      字符串的map标记，对应的key的值只能是d1~d30/info1~info10范围的值
  ///
  /// @param values    数值的map标记，对应的key的值只能是v1~v30范围的值
  ///
  /// @return 用户行为事件 uuid，如果返回为null，则表示生成自定义用户行为事件失败
  Future<String?> customEvent(
    String category,
    Map<String, String> tags,
    Map<String, int> values,
  ) {
    return QapmPlatform.instance.customEvent(category, tags, values);
  }
}
