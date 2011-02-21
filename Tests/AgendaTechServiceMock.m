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
	[delegate responseReceived:nil];
}

-(void)eventos
{
	NSString *path = configuration.resources.eventos;
	NSString *url = [[configuration.url absoluteString] stringByAppendingPathComponent:path];
	[self request:[NSURL URLWithString:url]];
}

#pragma mark -
#pragma mark NSURLConnection delegate implementation
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
}

@end
