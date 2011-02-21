#import "GTMSenTestCase.h"

#import "MocksHeader.h"

@interface AgendaTechTests : GTMTestCase
{
	AgendaTechServiceMock *service;
	AgendaTechMock *agendaTech;
	AgendaTechClientMock *client;
}
@end

@implementation AgendaTechTests

-(void)setUp
{
	service = [[AgendaTechServiceMock alloc] init];
	agendaTech = [[AgendaTechMock alloc] initWithService:service];
	
	client = [[AgendaTechClientMock alloc] init];
	agendaTech.delegate = client;
}

-(void)tearDown
{
	[service release];
	[agendaTech release];
	[client release];
}

-(void)test_should_assyncronously_retrieve_the_events
{
	[agendaTech requestAllEvents];
	
	STAssertTrue([client.eventos count] > 0, @"AgendaTech should call client passing an array of events.");
}

@end
