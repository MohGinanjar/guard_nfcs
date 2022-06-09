#import "NfcGuardPatrolPlugin.h"
#if __has_include(<nfc_guard_patrol/nfc_guard_patrol-Swift.h>)
#import <nfc_guard_patrol/nfc_guard_patrol-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "nfc_guard_patrol-Swift.h"
#endif

@implementation NfcGuardPatrolPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNfcGuardPatrolPlugin registerWithRegistrar:registrar];
}
@end
