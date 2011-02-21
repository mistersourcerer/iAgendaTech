#import "GTMSenTestCase.h"

#import "MocksHeader.h"

@interface AgendaTechServiceTests : GTMTestCase
{
	AgendaTechServiceMock *service;
	AgendaTechMock *agendaTech;
	AgendaTechServiceConfiguration *configuration;
}
@end


@implementation AgendaTechServiceTests

-(void)setUp
{
	configuration = [[AgendaTechServiceConfiguration alloc] init];
	//configuration.url = [NSURL URLWithString:@"http://agendatech.com.br"];
	configuration.url = [NSURL URLWithString:@"http://localrosca"];
	configuration.resources.eventos = @"/mobile/eventos";
	
	service = [[AgendaTechServiceMock alloc] initWithConfiguration:configuration];
	agendaTech = [[AgendaTechMock alloc] initWithService:service];
}

-(void)tearDown
{
	[service release];
	[agendaTech release];
	[configuration release];
}

-(void)test_sould_make_request_for_resource_eventos
{
	[service eventos];

	NSString *expectedUrl = [[configuration.url absoluteString] stringByAppendingPathComponent:configuration.resources.eventos];
	STAssertTrue([expectedUrl isEqual:service.lastCalledUrl], @"Last requested resource should be eventos");
}

-(void)test_should_notify_delegate_when_response_data_is_complete
{
	[service eventos];
	
	STAssertTrue([agendaTech responseReceived], @"should call delegate method when the request is finished");
}

@end
