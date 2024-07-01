#import "QapmPlugin.h"

#if __has_include("qapmPlugin-Swift.h")
#import "qapmPlugin-Swift.h"
#else
#import "Runner-Swift.h"
#endif

@implementation QapmPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQapmPlugin registerWithRegistrar:registrar];
}
@end