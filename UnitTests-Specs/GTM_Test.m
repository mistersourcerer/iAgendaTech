#import "GTMSenTestCase.h"

@interface GTM_Test : GTMTestCase
{
	
}
@end


@implementation GTM_Test

- (void) testMath
{
	STAssertFalse((1+1) == 3, @"Hummm... something is wrong.");
}

@end
