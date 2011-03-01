//
//  Detail.h
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Evento;

@interface Detail : UIViewController {
}

@property(nonatomic, retain) IBOutlet UILabel *descricao;
@property(nonatomic, retain) Evento *evento;

-(id)initWithEvento:(Evento *)evento;

@end
