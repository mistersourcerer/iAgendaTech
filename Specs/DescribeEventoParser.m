#import <Foundation/Foundation.h>
#import "UISpec.h"

#import "Evento.h"
#import "EventoParser.h"

@interface DescribeEventoParser : NSObject<UISpec> {}
	NSDictionary *dadosEvento;
@end

@implementation DescribeEventoParser

- (void) beforeAll {
	dadosEvento = [[NSDictionary dictionaryWithObjectsAndKeys:
				   @"evento tal", @"name",
				   nil] retain];
}

- (void) afterAll {
	[dadosEvento release];
}

- (void) itShouldParseAnEventDictionary {
	EventoParser *parser = [[EventoParser alloc] init];
	Evento *evento = [parser parse:dadosEvento];
	// testa se o evento gerado é igual a um objeto previamente populado
}

@end
