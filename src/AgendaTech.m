//
//  AgendaTech.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTech.h"
#import "JSON.h"

@implementation AgendaTech

@synthesize service, delegate;

-(id)initWithService:(NSObject<AgendaTechService> *)newService
{
	if (self = [super init]) {
		service = newService;
		[service retain];
		service.delegate = self;
	}
	return self;
}

-(void)requestAllEvents
{
	[service eventos];
}

-(NSArray *)eventosFromJsonString:(NSString *)jsonString error:(NSError **)error {
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSArray *eventos = [parser objectWithString:jsonString error:error];
	[parser release];
	return eventos;
}

-(NSDate *)parseDateFromString:(NSString *)date {
	// Removing de : from timezone
	NSMutableString *stringDate = [NSMutableString string];
	[stringDate appendString:[date substringToIndex:22]];
	[stringDate appendString:[date substringFromIndex:23]];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd'T'hh:mm:ssZ"];
	NSDate *formattedDate = [formatter dateFromString:stringDate];
	
	[formatter release];
	[stringDate release];
	return formattedDate;
}

-(Evento *)eventoFromDicitionary:(NSDictionary *)eventoDic {
	Evento *evento = [[[Evento alloc] init] autorelease];
	
	NSString *date = [eventoDic objectForKey:@"data"];
	evento.data = [self parseDateFromString:date];
	return evento;
}

-(NSArray *)eventosFromArrayOfDictionary:(NSArray *)arrayEventos {
	NSMutableArray *eventos = [NSMutableArray arrayWithCapacity:[arrayEventos count]];
	for (NSDictionary *evtDic in arrayEventos) {
		NSDictionary *eventoDic = [evtDic objectForKey:@"evento"];
		Evento *evento = [self eventoFromDicitionary:eventoDic];
		[eventos addObject:evento];
	}
	return [NSArray arrayWithArray:eventos];
}

#pragma mark -
#pragma mark AgendaTechServiceDelegate implementation
-(void)responseReceived:(NSString *)response
{
	NSError *error = nil;	
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSArray *eventosRaw = [parser objectWithString:response error:&error];
	if (error == nil) {
		NSArray *eventos = [self eventosFromArrayOfDictionary:eventosRaw];
		[delegate didLoadEvents:eventos];
	}
}

#pragma mark -
- (void)dealloc
{
	[service release];
	[super dealloc];
}

@end
