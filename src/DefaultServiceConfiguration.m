//
//  DefaultServiceConfiguration.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "DefaultServiceConfiguration.h"


@implementation DefaultServiceConfiguration

-(id)init {
	if (self = [super init]) {
		self.url = [NSURL URLWithString:@"http://agendatech.com.br"];
		self.resources.eventos = @"/mobile/eventos";
	}
	return self;
}

-(void)dealloc {
	self.url = nil;
	self.resources = nil;
	[super dealloc];
}

@end
