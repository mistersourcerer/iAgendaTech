//
//  AgendaTechService.h
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AgendaTechClient.h"
#import "AgendaTechServiceDelegate.h"

@protocol AgendaTechService<AgendaTechServiceDelegate>

@property(nonatomic, retain) NSObject<AgendaTechClient> *delegate;
@property(nonatomic, retain) NSURL *url;
@property(nonatomic, retain) NSString *eventosResource;

-(void)loadAllEvents;

@end
