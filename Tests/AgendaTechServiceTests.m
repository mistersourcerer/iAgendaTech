#import "GTMSenTestCase.h"

#import "AgendaTech.h"

#import "ClientMock.h"
#import "ServiceMock.h"

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
	STAssertTrue(isAnEvento, @"Should be an evento.");
}

- (void) test_should_create_an_array_of_eventos_after_receive_a_json_string_from_request {
	[service loadAllEvents];
	
	/*fixture: {
	 "evento": {
		"logo_updated_at":"2011-02-20T11:59:18-03:00",
		"created_at":"2011-02-20T11:59:18-03:00",
		"data":"2011-02-22T00:00:00-03:00","call_4_paperz_id":null,"data_termino":"2011-02-22T00:00:00-03:00","nome":"I Encontro de Inova\u00e7\u00e3o em TI da Faculdade Pit\u00e1goras","updated_at":"2011-02-20T11:59:31-03:00","aprovado":true,"logo_file_name":"faculdade-pitagoras-logo.jpg","id":263,"grupo_id":null,"twitter_hash":"inovacao_ti","site":"http://www.faculdadepitagoras.com.br/BeloHorizonte/aunidade/Paginas/Eventos.aspx","cached_slug":"i-encontro-de-inovacao-em-ti-da-faculdade-pitagoras","estado":"MG","descricao":"<p>Conhe&ccedil;a as tend&ecirc;ncias do mundo da TI com quem mais entendo do assunto.</p>","logo_content_type":"image/jpeg","logo_file_size":53783,"twitter":"inovacao_ti"}},
	*/
	
	Evento *evento = [client.eventos objectAtIndex:0];
	
	NSDate *date = [[NSDate alloc] initWithString:@"2011-02-22 00:00:00 -0300"];
	BOOL isDateEqualsFixtureDate = [evento.data isEqual:date];
	NSString *errorMsg = [NSString stringWithFormat:@"Date should be: %@ but is: %@", date, evento.data];
	STAssertTrue(isDateEqualsFixtureDate, errorMsg);
}

@end
