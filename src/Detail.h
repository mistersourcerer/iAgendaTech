//
//  Detail.h
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Evento;

@interface Detail : UIViewController<UIWebViewDelegate> {
}

@property(nonatomic, retain) IBOutlet UIWebView *descricaoHTML;
@property(nonatomic, retain) IBOutlet UILabel *titulo;
@property(nonatomic, retain) IBOutlet UILabel *dataInicio;
@property(nonatomic, retain) IBOutlet UILabel *dataFim;
@property(nonatomic, retain) IBOutlet UILabel *tags;
		  
@property(nonatomic, retain) Evento *evento;

-(id)initWithEvento:(Evento *)evento;

@end
