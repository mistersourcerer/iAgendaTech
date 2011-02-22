//
//  AgendaTechMock.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTechMock.h"


@implementation AgendaTechMock

@synthesize responseReceived;

-(void)responseReceived:(NSString *)response
{
	responseReceived = YES;
}

-(void)requestAllEvents
{
	Evento *e = [[Evento alloc] init];
	[self.delegate didLoadEvents:[NSArray arrayWithObject:e]];
}

@end
