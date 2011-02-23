//
//  AgendaTechServiceMock.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTechServiceMock.h"

@implementation AgendaTechServiceMock

@synthesize lastCalledUrl, configuration, delegate;

-(id)initWithConfiguration:(AgendaTechServiceConfiguration *)newConfiguration
{
	if (self = [super init]) {
		configuration = newConfiguration;
	}
	return self;
}

-(void)request:(NSURL *)url
{
	lastCalledUrl = [url absoluteString];
	NSMutableString *jsonPath = [[NSMutableString alloc] init];
	[jsonPath appendString:[[NSFileManager defaultManager] currentDirectoryPath]];
	[jsonPath appendString:@"/Tests/fixtures/eventos_json"];
	NSString *response = [NSString stringWithContentsOfFile:jsonPath encoding:NSStringEncodingConversionAllowLossy error:nil];
	[jsonPath release];
	
	[delegate responseReceived:response];
}

-(void)eventos
{
	NSString *path = configuration.resources.eventos;
	NSString *url = [[configuration.url absoluteString] stringByAppendingPathComponent:path];
	[self request:[NSURL URLWithString:url]];
}

@end
