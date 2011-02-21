#import "GTMSenTestCase.h"

#import "MocksHeader.h"

#import "AgendaTech.h"

@interface AgendaTechTests : GTMTestCase
{
	
}
@end

@implementation AgendaTechTests

- (void) test_should_retrieve_the_events
{
	AgendaTechServiceMock *service = [[AgendaTechServiceMock alloc] init];
	AgendaTech *agendaTech = [[AgendaTech alloc] initWithService:service];
	
	NSArray *events = [agendaTech allEvents];
	
	BOOL isEventsPopulated = [events count] > 0;
	STAssertTrue(isEventsPopulated, @"Events should not be empty");
}

@end
