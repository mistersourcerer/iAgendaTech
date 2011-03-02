//
//  Detail.m
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import "Detail.h"
#import "AgendaTech.h"

@implementation Detail

@synthesize evento;
@synthesize descricaoHTML, titulo, dataInicio, dataFim, tags;

-(void)configureScrollSize {
	UIScrollView *scroll = (UIScrollView *)self.view;
	float scrollHeight = (self.view.frame.size.height + descricaoHTML.frame.size.height) - 160;
	scroll.contentSize = CGSizeMake(scroll.contentSize.width, scrollHeight);
}

-(void)configureDescricao:(NSString *)desc {
	NSString *html = [NSString stringWithFormat:@"<html><body><div id='iagendatech_descricao_'>%@</div></body></html>", desc];
	
	descricaoHTML.delegate = self;
	[descricaoHTML loadHTMLString:html baseURL:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *offsetHeightString = [descricaoHTML stringByEvaluatingJavaScriptFromString:@"document.getElementById(\"iagendatech_descricao_\").offsetHeight;"];
	
	int offsetHeight = [offsetHeightString intValue];
	if (offsetHeight == 0) {
		offsetHeight = 140;
	}
	
	CGRect frame = descricaoHTML.frame;
	frame.size.height = offsetHeight + 50;
	descricaoHTML.frame = frame;
	
	[self configureScrollSize];
}

#pragma mark -
-(id)initWithEvento:(Evento *)newEvento {
	if (self = [super init]) {
		self.evento = newEvento;
	}
	return self;
}

-(void)viewDidAppear:(BOOL)animated {
	[self configureDescricao:evento.descricao];
	self.titulo.text	= evento.nome;
}

#pragma mark -
-(void)dealloc {
	[evento release];
	[super dealloc];
}

@end
