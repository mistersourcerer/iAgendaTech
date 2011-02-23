//
//  Evento.m
//  iAgendaTech
//
//  Created by Ricardo on 2/22/11.
//  Copyright 2011 _. All rights reserved.
//

#import "Evento.h"


@implementation Evento

@synthesize data, nome;

- (id) init {
	if (self = [super init]) {
		self.data = [NSDate date];
	}
	return self;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@ - %@",
			self.nome, self.data];
}

@end
