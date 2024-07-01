#import "QapmPlugin.h"

#if __has_include(<qapm/QapmPlugin-Swift.h>)
#import <qapm/QapmPlugin-Swift.h>
#else
#import "qapmPlugin-Swift.h"
#endif

@implementation QapmPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftQapmPlugin registerWithRegistrar:registrar];
}
@end