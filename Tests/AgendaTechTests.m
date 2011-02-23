#import "GTMSenTestCase.h"

#import "MocksHeader.h"

#import "Evento.h"

#import "AgendaTechClient.h"
#import "DefaultServiceConfiguration.h"

/*
@interface AgendaTechTests : GTMTestCase
{
	AgendaTechServiceMock *service;
	AgendaTech *agendaTech;
	AgendaTechClientMock<AgendaTechClient> *client;
}
@end

@implementation AgendaTechTests

-(void)setUp {
	AgendaTechServiceConfiguration *c = [[DefaultServiceConfiguration alloc] init];
	service = [[AgendaTechServiceMock alloc] initWithConfiguration:c];
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

-(void)test_should_return_an_array_of_events_given_a_valid_json_string {
	[agendaTech requestAllEvents];
	
	NSObject *evento = [client.eventos objectAtIndex:0];
	BOOL isUmEvento = [evento isKindOfClass:[Evento class]];
	STAssertTrue(isUmEvento, @"The first object in array should be an Evento.");
}

-(void)test_should_parse_an_ISO8601_date_representation {
	[agendaTech requestAllEvents];
	NSDate *data = [[NSDate alloc] initWithString:@"2011-02-22 00:00:00 -0300"];
	Evento *evento = [client.eventos objectAtIndex:0];
	
	BOOL isDataCorrectlyParsed = [evento.data isEqual:data];
	NSString *errorMsg = [NSString stringWithFormat:@"The event date %@ should be equals %@", evento.data, data];
	STAssertTrue(isDataCorrectlyParsed, errorMsg);
}
@end
*/
