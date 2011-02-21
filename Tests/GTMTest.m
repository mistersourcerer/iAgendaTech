#import "GTMSenTestCase.h"

@interface GTMTest : GTMTestCase
{
	
}
@end

@implementation GTMTest

- (void) testMath
{
	STAssertFalse((1+1) == 3, @"Oops, your compiler need some math classes.");
}

@end
