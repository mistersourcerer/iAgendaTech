//
//  EventoParser.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "EventoParser.h"
#import "Evento.h"
#import "JSON.h"

@implementation EventoParser

-(NSDate *) parseDateFromString:(NSString *)date {
	// Removing de : from timezone
	NSMutableString *stringDate = [NSMutableString string];
	[stringDate appendString:[date substringToIndex:22]];
	[stringDate appendString:[date substringFromIndex:23]];
	
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd'T'hh:mm:ssZ"];
	NSDate *formattedDate = [formatter dateFromString:stringDate];
	[formatter release];
	
	return formattedDate;
	
}

-(Evento *) createEventoFromDicitionary:(NSDictionary *)eventoDic {
	Evento *evento		= [[[Evento alloc] init] autorelease];
	evento.nome			= [eventoDic objectForKey:@"nome"];
	evento.estado		= [eventoDic objectForKey:@"estado"];
	evento.data			= [self parseDateFromString:[eventoDic objectForKey:@"data"]];
	evento.dataTermino	= [self parseDateFromString:[eventoDic objectForKey:@"data_termino"]];
	evento.descricao	= [eventoDic objectForKey:@"descricao"];
	evento.site			= [NSURL URLWithString:[eventoDic objectForKey:@"site"]];
	evento.logo			= [eventoDic objectForKey:@"logo_file_name"];
	evento.niceURL = [eventoDic objectForKey:@"cached_slug"];

	return evento;
}

-(Evento *) parse:(NSString *)json error:(NSError **)error {
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSDictionary *wrapperDic = [parser objectWithString:json error:error];
	NSDictionary *eventoDic = [wrapperDic objectForKey:@"evento"];
	return [self createEventoFromDicitionary:eventoDic];
}

-(NSArray *) parseJsonArray:(NSString *)json error:(NSError **)error {
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSArray *jsonArray = [parser objectWithString:json error:error];
	NSMutableArray *eventos = [NSMutableArray arrayWithCapacity:[jsonArray count]];
	for (NSDictionary *wrapperDic in jsonArray) {
		NSDictionary *eventoDic = [wrapperDic objectForKey:@"evento"];
		[eventos addObject:[self createEventoFromDicitionary:eventoDic]];
	}
	return [NSArray arrayWithArray:eventos];
}

@end
