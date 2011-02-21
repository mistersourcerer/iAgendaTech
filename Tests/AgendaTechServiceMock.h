//
//  AgendaTechServiceMock.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AgendaTechService.h"


@interface AgendaTechServiceMock : NSObject<AgendaTechService> {
}

@property(nonatomic, retain, readonly) NSString *lastCalledUrl;

@end
