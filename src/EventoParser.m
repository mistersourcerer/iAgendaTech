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

-(Evento *) parse:(NSString *)json error:(NSError **)error {
	Evento *evento = [[[Evento alloc] init] autorelease];
	
	SBJsonParser *parser = [[SBJsonParser alloc] init];
	NSDictionary *wrapperDic = [parser objectWithString:json error:error];
	NSDictionary *eventoDic = [wrapperDic objectForKey:@"evento"];
	
	
	return evento;
}

@end
