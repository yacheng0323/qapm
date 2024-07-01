#import "QapmPlugin.h"


@implementation QapmPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQapmPlugin registerWithRegistrar:registrar];
}
@end