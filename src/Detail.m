//
//  Detail.m
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import "Detail.h"


@implementation Detail

-(void)viewDidLoad {
	UIScrollView *scroll = (UIScrollView *)self.view;
	scroll.contentSize = CGSizeMake(scroll.contentSize.width, 1000);
}

@end
