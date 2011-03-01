//
//  RemoteSerivce.m
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import "RemoteSerivce.h"
#import "EventoParser.h"

@implementation RemoteSerivce

#pragma mark -
-(id)init {
	if (self = [super init]) {
		self.url = [NSURL URLWithString:@"http://www.agendatech.com.br"];
		self.eventosResource = @"/mobile/eventos";
		self.niceUrlResource = @"/eventos/tecnologia";
		receivedData = [[NSMutableData data] retain];
	}
	return self;
}

#pragma mark -
#pragma mark AgendaTechService implementation
@synthesize delegate, eventosResource, url, niceUrlResource;

-(void)responseReceived:(NSString *)response {
	EventoParser *parser = [[EventoParser alloc] init];
	NSError *error = nil;
	NSArray *eventos = [parser parseJsonArray:response error:&error];
	if (error == nil && [delegate respondsToSelector:@selector(didLoadEvents:)]) {
		[delegate didLoadEvents:eventos];
	}
	[parser release];
}

-(void)requestUrl:(NSURL *)requestUrl {
	NSURLRequest *request = [NSURLRequest requestWithURL:requestUrl];
	NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request
																  delegate:self];
	[connection release];
}

-(void)loadAllEvents {
	[self requestUrl:[url URLByAppendingPathComponent:eventosResource]];
}

#pragma mark -
#pragma mark NSURLConnection delegate implementation
-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
	NSString *strReponse = [[NSString alloc] initWithData:receivedData
												 encoding:NSUTF8StringEncoding];
	[self responseReceived:strReponse];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

#pragma mark -
-(void)dealloc {
	[receivedData release];
	[super dealloc];
}

@end
