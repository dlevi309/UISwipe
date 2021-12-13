#define tweakIdentifier @"daniel.uiswipe"
#define CHECK_TARGET

#import "../PSHeader/PS.h"
#import "../PSPrefs/PSPrefs.x"

static BOOL shouldEnableForBundleIdentifier(NSString *bundleIdentifier) {
    NSDictionary *preferences = Prefs();
    NSArray <NSString *> *value = preferences[@"UISwipe"];
    return [value containsObject:bundleIdentifier];
}

#pragma mark - UIDevice

%hook UIDevice
- (long long)userInterfaceIdiom { return 1; }
%end

%ctor {
    if (isTarget(TargetTypeApps) && shouldEnableForBundleIdentifier(NSBundle.mainBundle.bundleIdentifier)) {
        %init;
    }
}
