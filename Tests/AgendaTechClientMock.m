//
//  AgendaTechClientMock.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTechClientMock.h"


@implementation AgendaTechClientMock

@synthesize eventos;

-(void)didLoadEvents:(NSArray *)events
{
	self.eventos = events;
}

-(void)release
{
	[eventos release];
}

@end
