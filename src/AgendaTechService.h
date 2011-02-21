//
//  AgendaTechService.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgendaTechServiceConfiguration.h"
#import "AgendaTechServiceDelegate.h"

@protocol AgendaTechService

@property(nonatomic, retain) AgendaTechServiceConfiguration *configuration;
@property(nonatomic, retain) NSObject<AgendaTechServiceDelegate> *delegate;

-(id)initWithConfiguration:(AgendaTechServiceConfiguration *)configuration;

-(void)eventos;

#pragma mark -
#pragma mark NSURLConnection delegate methods
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;
-(void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
