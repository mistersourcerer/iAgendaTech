//
//  TableViewCellConfigurator.h
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol TableViewCellConfigurator

-(UITableViewCell *)configureCell:(UITableViewCell *)cell withObject:(id)object;

@end
