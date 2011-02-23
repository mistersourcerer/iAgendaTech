#import "GTMSenTestCase.h"

#import "AgendaTech.h"

#import "ClientMock.h"
#import "ServiceMock.h"
#import "BogusEvento.h"

@interface AgendaTechServiceTests : GTMTestCase
{
	ServiceMock *service;
	ClientMock *client;
}
@end

@implementation AgendaTechServiceTests

-(void)setUp {
	service = [[ServiceMock alloc] init];
	service.url = [NSURL URLWithString:@"http://www.agendatech.com.br"];
	service.eventosResource = @"/mobile/eventos";
	
	client = [[ClientMock alloc] init];
	
	service.delegate = client;
}

-(void)tearDown {
	[service release];
	[client release];
}

- (void) test_should_call_didLoadEvents_on_delegate_after_receive_the_response {
	STAssertFalse(client.didLoadEventsCalled, @"The control variable is broken, method not called yet.");
	[service loadAllEvents];
	
	STAssertTrue(client.didLoadEventsCalled, @"The delegate method was not called.");
}

- (void) test_should_send_an_array_to_client_using_the_delegate_method {
	BOOL isWithoutEvents = [client.eventos count] == 0;
	STAssertTrue(isWithoutEvents, @"Humm, should be eventoless until call service#loadAllEvents");
	[service loadAllEvents];
	
	BOOL isWithEvents = [client.eventos count] > 0;
	STAssertTrue(isWithEvents, @"Should have at least 1 evento.");
}

- (void) test_should_request_eventos_from_remote_server {
	[service loadAllEvents];
	
	NSURL *u = [service.url URLByAppendingPathExtension:service.eventosResource];
	BOOL isLastUrlCalledEqualsEventosUrl = [service.lastCalledUrl isEqual:[u absoluteString]];
	NSString *errorMsg = [NSString stringWithFormat:@"Service need to call %@ but called: %@", [u absoluteString], service.lastCalledUrl];
	STAssertTrue(isLastUrlCalledEqualsEventosUrl, errorMsg);
}

- (void) test_should_send_an_array_of_eventos_to_client {
	[service loadAllEvents];

	Evento *evento = [client.eventos objectAtIndex:0];
	BOOL isAnEvento = [evento isKindOfClass:[Evento class]];
	STAssertTrue(isAnEvento, @"Should be an Evento.");
}

- (void) test_should_send_an_array_of_valid_eventos_to_client {
	[service loadAllEvents];
	
	Evento *evento = [[BogusEvento alloc] init];
	Evento *parsed = [client.eventos objectAtIndex:0];
	
	BOOL isValidEvento = [parsed isEqual:evento];
	STAssertTrue(isValidEvento, @"Should be a valid Evento.");
	
	[evento release];
}
@end
