//
//  AgendaTech.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AgendaTechServiceDelegate.h"
#import "AgendaTechService.h"
#import "AgendaTechClient.h"
#import "Evento.h"

@interface AgendaTech : NSObject<AgendaTechServiceDelegate>	{

}

@property(nonatomic, retain) NSObject<AgendaTechService> *service;
@property(nonatomic, retain) NSObject<AgendaTechClient> *delegate;

-(id)initWithService:(NSObject<AgendaTechService> *)service;
-(void)requestAllEvents;

@end
