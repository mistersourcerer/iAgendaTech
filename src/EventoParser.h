//
//  EventoParser.h
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Evento;

@interface EventoParser : NSObject {

}

-(Evento *) parse:(NSString *)json error:(NSError **)error;

@end
