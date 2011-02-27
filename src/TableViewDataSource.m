//
//  TableViewDataSource.m
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import "TableViewDataSource.h"


@implementation TableViewDataSource

@synthesize list, delegate;

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
	}
	
	if ([delegate respondsToSelector:@selector(configureCell:withObject:)]) {
		[delegate configureCell:cell withObject:[list objectAtIndex:indexPath.row]];
	}

	return cell;
}

@end
