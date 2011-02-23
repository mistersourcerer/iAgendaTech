//
//  BogusEvento.m
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import "BogusEvento.h"

@implementation BogusEvento

-(id)init {
	if (self = [super init]) {
		self.nome			= @"I Encontro de Inovação em TI da Faculdade Pitágoras";
		self.estado			= @"MG";
		self.data			= [[NSDate alloc] initWithString:@"2011-02-22 00:00:00 -0300"];
		self.dataTermino	= [[NSDate alloc] initWithString:@"2011-02-22 00:00:00 -0300"];
		self.descricao		= @"<p>Conhe&ccedil;a as tend&ecirc;ncias do mundo da TI com quem mais entendo do assunto.</p>";
		self.site			= [NSURL URLWithString:@"http://www.faculdadepitagoras.com.br/BeloHorizonte/aunidade/Paginas/Eventos.aspx"];
		self.logo			= @"faculdade-pitagoras-logo.jpg";
		self.niceURL		= @"i-encontro-de-inovacao-em-ti-da-faculdade-pitagoras";
	}
	return self;
}

@end
