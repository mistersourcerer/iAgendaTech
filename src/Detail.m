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
@synthesize descricao;

-(void)configureScrollSize {
	UIScrollView *scroll = (UIScrollView *)self.view;
	float scrollHeight = (self.view.frame.size.height + descricao.frame.size.height) - 110;
	scroll.contentSize = CGSizeMake(scroll.contentSize.width, scrollHeight);
}

-(void)configureDescricao:(NSString *)desc {
	CGSize labelSize = [desc sizeWithFont:descricao.font
						constrainedToSize:CGSizeMake(descricao.frame.size.width, 9999) 
							lineBreakMode:descricao.lineBreakMode];
	
	CGRect frame = descricao.frame;
	frame.size.height = labelSize.height;
	descricao.frame = frame;
	descricao.text = desc;
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
	[self configureScrollSize];
}

#pragma mark -
-(void)dealloc {
	[evento release];
	[super dealloc];
}

@end
