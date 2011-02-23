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
	Evento *evento = [[[Evento alloc] init] autorelease];
	evento.data = [self parseDateFromString:[eventoDic objectForKey:@"data"]];
	return evento;
}

-(Evento *) parse:(NSString *)json error:(NSError **)error {
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSDictionary *wrapperDic = [parser objectWithString:json error:error];
	NSDictionary *eventoDic = [wrapperDic objectForKey:@"evento"];
	return [self createEventoFromDicitionary:eventoDic];
}

@end
