#import <Foundation/Foundation.h>
#import "UISpec.h"
#import <OCMock.h>

@interface DescribeEventsStreamDataSource : NSObject<UISpec> {}
@end

@implementation DescribeEventsStreamDataSource

- (void) itShouldLoadEventsAssynchronously {
	// mocar um streamdatasource aqui usa o json-framework
	// para carregar os eventos 
	id mock = [OCMockObject mockForClass:[EventsStreamDataSource class]];
	NSLog(@"mock: %@", mock);
}

@end
