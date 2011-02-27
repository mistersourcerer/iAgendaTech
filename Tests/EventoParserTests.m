#import "GTMSenTestCase.h"

#include "AgendaTech.h"

#include "BogusEvento.h"

@interface EventoParserTests : GTMTestCase
{
	NSString *json;
}
@end

@implementation EventoParserTests

- (void)setUp {
	/*Fixture:
	 logo_updated_at: "2011-02-20T11:59:18-03:00"
	 created_at: "2011-02-20T11:59:18-03:00"
	 data: "2011-02-22T00:00:00-03:00"
	 call_4_paperz_id: null
	 data_termino: "2011-02-22T00:00:00-03:00"
	 nome: "I Encontro de Inovação em TI da Faculdade Pitágoras"
	 updated_at: "2011-02-20T11:59:31-03:00"
	 aprovado: true
	 logo_file_name: "faculdade-pitagoras-logo.jpg"
	 id: 263
	 grupo_id: null
	 twitter_hash: "inovacao_ti"
	 site: "http://www.faculdadepitagoras.com.br/BeloHorizonte/aunidade/Paginas/Eventos.aspx"
	 cached_slug: "i-encontro-de-inovacao-em-ti-da-faculdade-pitagoras"
	 estado: "MG"
	 descricao: "<p>Conhe&ccedil;a as tend&ecirc;ncias do mundo da TI com quem mais entendo do assunto.</p>"
	 logo_content_type: "image/jpeg"
	 logo_file_size: 53783
	 twitter: "inovacao_ti"
	 */
	
	
	json = @"{\"evento\":{\"logo_updated_at\":\"2011-02-20T11:59:18-03:00\",\"created_at\":\"2011-02-20T11:59:18-03:00\",\"data\":\"2011-02-22T00:00:00-03:00\",\"call_4_paperz_id\":null,\"data_termino\":\"2011-02-22T00:00:00-03:00\",\"nome\":\"I Encontro de Inova\u00e7\u00e3o em TI da Faculdade Pit\u00e1goras\",\"updated_at\":\"2011-02-20T11:59:31-03:00\",\"aprovado\":true,\"logo_file_name\":\"faculdade-pitagoras-logo.jpg\",\"id\":263,\"grupo_id\":null,\"twitter_hash\":\"inovacao_ti\",\"site\":\"http://www.faculdadepitagoras.com.br/BeloHorizonte/aunidade/Paginas/Eventos.aspx\",\"cached_slug\":\"i-encontro-de-inovacao-em-ti-da-faculdade-pitagoras\",\"estado\":\"MG\",\"descricao\":\"<p>Conhe&ccedil;a as tend&ecirc;ncias do mundo da TI com quem mais entendo do assunto.</p>\",\"logo_content_type\":\"image/jpeg\",\"logo_file_size\":53783,\"twitter\":\"inovacao_ti\"}}";
}

- (void) test_should_parse_a_ISO8601_string_date {	
	NSDate *data = [[NSDate alloc] initWithString:@"2011-02-22 00:00:00 -0300"];
	
	EventoParser *parser = [[EventoParser alloc] init];
	Evento *parsed = [parser parse:json error:nil];
	
	NSString *errorMsg = [NSString stringWithFormat:@"Date should be %@ but is %@.", data, parsed.data];
	STAssertTrue([parsed.data isEqual:data], errorMsg);
}

- (void) test_should_create_an_Evento_from_a_valid_json {
	Evento *evento = [[BogusEvento alloc] init];
	
	EventoParser *parser = [[EventoParser alloc] init];
	Evento *parsed = [parser parse:json error:nil];
	
	NSString *errorMsg = [NSString stringWithFormat:@"The parsed Evento is not like the manually created one. %@, %@", parsed, evento];
	STAssertTrue([evento isEqual:parsed], errorMsg);
	[evento release];
}

@end
