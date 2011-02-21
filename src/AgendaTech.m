//
//  AgendaTech.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTech.h"


@implementation AgendaTech

@synthesize service;

-(id)initWithService:(NSObject<AgendaTechService> *)newService
{
	if (self = [super init]) {
		service = newService;
		[service retain];
		service.delegate = self;
	}
	return self;
}

-(NSArray *)allEvents
{
	//NSString *eventosJSON = [service eventos];

	NSMutableArray *events = [NSMutableArray arrayWithCapacity:1];
	[events addObject:@"oples"];
	
	return [NSArray arrayWithArray:events];
}

#pragma mark -
#pragma mark AgendaTechServiceDelegate implementation
-(void)responseReceived:(NSString *)response
{
}

#pragma mark -
- (void)dealloc
{
	[service release];
	[super dealloc];
}

@end
