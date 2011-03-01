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

@class TableViewDataSource, Detail;

@interface Lista : UIViewController<AgendaTechClient, TableViewCellConfigurator, UITableViewDelegate> {
	NSObject<AgendaTechService> *service;
	Detail *detailController;
}

@property(nonatomic, retain) IBOutlet UITableView *table;
@property(nonatomic, retain) IBOutlet TableViewDataSource *dataSource;

@end
