//
//  Evento.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "Evento.h"


@implementation Evento

@synthesize nome, estado, data, dataTermino, descricao, site, logo, niceURL;

-(BOOL)isEqual:(id)object {
	Evento *e = (Evento *)object;
	BOOL dataEq = [e.data isEqual:self.data];
	BOOL nomeEq = [e.nome isEqual:self.nome];
	
	BOOL isEqual = dataEq && nomeEq;
	return isEqual;
}

@end
