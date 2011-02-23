//
//  ClientMock.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "ClientMock.h"


@implementation ClientMock

@synthesize eventos, didLoadEventsCalled;

-(id)init {
	if (self = [super init]) {
		self.eventos = [NSArray array];
		self.didLoadEventsCalled = NO;
	}
	return self;
}

-(void)didLoadEvents:(NSArray *)array {
	self.eventos = array;
	self.didLoadEventsCalled = YES;
}

@end
