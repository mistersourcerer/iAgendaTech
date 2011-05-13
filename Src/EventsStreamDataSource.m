//
//  EventsStreamDataSource.m
//  iAgendaTech
//
//  Created by Ricardo on 5/13/11.
//  Copyright 2011 Backslashes. All rights reserved.
//

#import "EventsStreamDataSource.h"


@implementation EventsStreamDataSource

- (void)parser:(SBJsonStreamParser *)parser foundArray:(NSArray *)array {
	// começou o array com todos os eventos
}

- (void)parser:(SBJsonStreamParser *)parser foundObject:(NSDictionary *)dict {
	// recebeu um evento
}

@end
