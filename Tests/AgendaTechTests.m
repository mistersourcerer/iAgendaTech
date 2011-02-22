#import "GTMSenTestCase.h"

#import "MocksHeader.h"

#import "Evento.h"

@interface AgendaTechTests : GTMTestCase
{
	AgendaTechServiceMock *service;
	AgendaTechMock *agendaTech;
	AgendaTechClientMock *client;
}
@end

@implementation AgendaTechTests

-(void)setUp {
	service = [[AgendaTechServiceMock alloc] init];
	agendaTech = [[AgendaTechMock alloc] initWithService:service];
	
	client = [[AgendaTechClientMock alloc] init];
	agendaTech.delegate = client;
}

-(void)tearDown {
	[service release];
	[agendaTech release];
	[client release];
}

-(void)test_should_assyncronously_retrieve_the_events {
	[agendaTech requestAllEvents];
	
	STAssertTrue([client.eventos count] > 0, @"AgendaTech should call client passing an array of events.");
}

-(void)test_should_return_an_array_of_events {
	[agendaTech requestAllEvents];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	//[formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'-'z"];
	//NSDate *data = [formatter dateFromString:@"2011-02-22T00:00:00-03:00"];
	[formatter setDateFormat:@"yyyy-MM-dd'T'hh:mm:ssZ"];
	NSDate *data = [formatter dateFromString:@"2011-02-22T00:00:00-0300"];
	[formatter release];
	
	NSLog(@":: data: %@", data);
	
	Evento *evento = [client.eventos objectAtIndex:0];
	
	BOOL isDataEqualsInFixture = [evento.data isEqual:data];
	STAssertTrue(isDataEqualsInFixture, @"First event should have the same date of first json object returned in fixture.");
}

@end
