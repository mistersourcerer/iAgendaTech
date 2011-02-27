//
//  TableViewDataSource.h
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableViewCellConfigurator.h"

@interface TableViewDataSource : NSObject<UITableViewDataSource> {

}

@property(nonatomic, retain) NSArray *list;
@property(nonatomic, retain) IBOutlet NSObject<TableViewCellConfigurator> *delegate;

@end
