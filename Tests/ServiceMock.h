//
//  ServiceMock.h
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AgendaTech.h"

@interface ServiceMock : NSObject<AgendaTechService> {

}

@property(nonatomic, retain) NSString *eventosResource;
@property(nonatomic, retain) NSString *lastCalledUrl;

@end
