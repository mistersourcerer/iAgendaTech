#import <Foundation/Foundation.h>
#import "UISpec.h"

@interface HelloWorldUISpec : NSObject<UISpec> {
}

@end

@implementation HelloWorldUISpec

- (void) itShouldExecuteAExample {
	NSLog(@"inside the hellow world example.");
}

@end
