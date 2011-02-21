//
//  AgendaTech.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AgendaTechService.h"

@interface AgendaTech : NSObject<AgendaTechServiceDelegate>	{

}

@property(nonatomic, retain) NSObject<AgendaTechService> *service;

-(id)initWithService:(NSObject<AgendaTechService> *)service;
-(NSArray *)allEvents;

@end
