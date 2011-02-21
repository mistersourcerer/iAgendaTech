//
//  AgendaTechServiceConfiguration.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AgendaTechServiceResources.h"

@interface AgendaTechServiceConfiguration : NSObject {

}

@property(nonatomic, retain) NSURL *url;
@property(nonatomic, retain) AgendaTechServiceResources *resources;

@end
