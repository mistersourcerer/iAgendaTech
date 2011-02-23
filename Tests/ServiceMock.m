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

-(void)responseReceived:(NSString *)response {
	
	Evento *evento = [[[Evento alloc] init] autorelease];
	[delegate didLoadEvents:[NSArray arrayWithObject:evento]];
}

-(void)requestUrl:(NSURL *)requestUrl {
	self.lastCalledUrl = [requestUrl absoluteString];
	
	NSMutableString *jsonPath = [[NSMutableString alloc] init];
	[jsonPath appendString:[[NSFileManager defaultManager] currentDirectoryPath]];
	[jsonPath appendString:@"/Tests/fixtures/eventos_json"];
	NSString *response = [NSString stringWithContentsOfFile:jsonPath encoding:NSStringEncodingConversionAllowLossy error:nil];
	[jsonPath release];
	
	[self responseReceived:response];
}

-(void)loadAllEvents {
	[self requestUrl:[url URLByAppendingPathExtension:eventosResource]];
}

@end
