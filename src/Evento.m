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

- (NSString *)description {
	return [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@ %@ %@",
			[self.data description],
			[self.nome description],
			[self.estado description],
			[self.dataTermino description],
			[self.descricao description],
			[self.site description],
			[self.logo description],
			[self.niceURL description]];
}

-(NSUInteger)hash {
	return [[self description] hash];
}

-(BOOL)isEqual:(id)object {
	Evento *e = (Evento *)object;
	BOOL dataEq = [e.data isEqual:self.data];
	BOOL nomeEq = [e.nome isEqual:self.nome];
	BOOL estaEq = [e.estado isEqual:self.estado];
	BOOL termEq = [e.dataTermino isEqual:self.dataTermino];
	BOOL descEq = [e.descricao isEqual:self.descricao];
	BOOL siteEq = [e.site isEqual:self.site];
	BOOL logoEq = [e.logo isEqual:self.logo];
	BOOL nurlEq = [e.niceURL isEqual:self.niceURL];

	BOOL isEqual = dataEq && nomeEq && estaEq && termEq && descEq && siteEq && logoEq && nurlEq;
	return isEqual;
}

@end
