#import <Foundation/Foundation.h>
#import "UISpec.h"
//#import "OCMock.h"

@interface DescribeStreamDataSource : NSObject<UISpec> {}
@end

@implementation DescribeStreamDataSource

- (void) itShouldLoadEventsAssynchronously {
	// mocar um streamdatasource aqui usa o json-framework
	// para carregar os eventos
	//id mock = [OCMockObject mockForClass:[NSString class]];
}

@end
