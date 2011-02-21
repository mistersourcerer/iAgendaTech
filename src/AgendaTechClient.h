//
//  AgendaTechClient.h
//  iAgendaTech
//
//  Created by Ricardo on 2/21/11.
//  Copyright 2011 _. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol AgendaTechClient

-(void)didLoadEvents:(NSArray *)events;

@end
