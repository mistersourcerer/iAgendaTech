//
//  Evento.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "Evento.h"


@implementation Evento

@synthesize data;

-(BOOL)isEqual:(id)object {
	Evento *e = (Evento *)object;
	return [e.data isEqual:self.data];
}

@end
