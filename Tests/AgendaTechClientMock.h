//
//  AgendaTechClientMock.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AgendaTechClient.h"

@interface AgendaTechClientMock : NSObject<AgendaTechClient> {
}

@property(nonatomic, retain) NSArray *eventos;

@end
