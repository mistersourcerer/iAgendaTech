#import <Foundation/Foundation.h>
#import "UISpec.h"

@interface HelloWorld : NSObject<UISpec> {}
@end

@implementation HelloWorld

- (void) itShouldExecuteAExample {
  NSLog(@"inside the hellow world example.");
}

@end
