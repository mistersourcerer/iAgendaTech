//
//  ServiceMock.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "ServiceMock.h"
#import "EventoParser.h"


@implementation ServiceMock

@synthesize delegate, eventosResource, lastCalledUrl, url;

-(void)responseReceived:(NSString *)response {
	EventoParser *parser = [[EventoParser alloc] init];
	NSError *error = nil;
	NSArray *eventos = [parser parseJsonArray:response error:&error];
	if (error == nil) {
		[delegate didLoadEvents:eventos];
	}
	[parser release];
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
