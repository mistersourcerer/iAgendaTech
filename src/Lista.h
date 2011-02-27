//
//  Lista.h
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AgendaTechClient.h"
#import "TableViewCellConfigurator.h"

@class TableViewDataSource;

@interface Lista : UIViewController<AgendaTechClient, TableViewCellConfigurator> {
	NSObject<AgendaTechService> *service;
}

@property(nonatomic, retain) IBOutlet UITableView *table;
@property(nonatomic, retain) IBOutlet TableViewDataSource *dataSource;

@end
