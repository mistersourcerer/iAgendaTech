//
//  AgendaTechServiceConfiguration.m
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTechServiceConfiguration.h"


@implementation AgendaTechServiceConfiguration

@synthesize url, resources;

-(id)init
{
	if (self = [super init]) {
		resources = [[AgendaTechServiceResources alloc] init];
	}
	return self;
}

-(void)dealloc
{
	[resources release];
	[super dealloc];
}

@end
