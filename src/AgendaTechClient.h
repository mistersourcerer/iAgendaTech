//
//  AgendaTechClient.h
//  iAgendaTech
//
//  Created by Ricardo on 2/23/11.
//  Copyright 2011 _. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AgendaTechClient

@property(nonatomic, retain) NSArray *eventos;

-(void)didLoadEvents:(NSArray *)array;

@end
