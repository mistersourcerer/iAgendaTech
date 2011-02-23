//
//  ServiceMock.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "ServiceMock.h"


@implementation ServiceMock

@synthesize delegate, eventosResource, lastCalledUrl, url;

-(void)loadAllEvents {
	self.lastCalledUrl = [[url absoluteString] stringByAppendingString:eventosResource];
	
	Evento *evento = [[[Evento alloc] init] autorelease];
	
	[delegate didLoadEvents:[NSArray arrayWithObject:evento]];
}

@end
