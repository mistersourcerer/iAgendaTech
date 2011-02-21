#import "GTMSenTestCase.h"

@interface GTMTest : GTMTestCase
{
	
}
@end

@implementation GTMTest

- (void) testMath
{
	STAssertTrue((1+1) == 3, @"You've got a failing test");
}

@end
