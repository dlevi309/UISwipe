#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

%hook UIDevice
- (long long)userInterfaceIdiom {
    return 1;
}
%end
%hook UIStatusBarStyleAttributes
- (long long)idiom {
    return 0;
}
%end
