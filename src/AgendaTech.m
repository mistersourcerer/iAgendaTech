//
//  AgendaTech.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTech.h"

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

#pragma mark -
#pragma mark AgendaTechServiceDelegate implementation
-(void)responseReceived:(NSString *)response
{
	Evento *e = [[[Evento alloc] init] autorelease];
	NSArray *eventos = [NSArray arrayWithObject:e];
	// parser json:response
	[delegate didLoadEvents:eventos];
}

#pragma mark -
- (void)dealloc
{
	[service release];
	[super dealloc];
}

@end
