//
//  Lista.m
//  iAgendaTech
//
//  Created by Ricardo Valeriano dos Santos on 2/27/11.
//  Copyright 2011 _. All rights reserved.
//

#import "AgendaTech.h"
#import "Lista.h"
#import "TableViewDataSource.h"
#import "RemoteSerivce.h"
#import "Detail.h"

@implementation Lista

@synthesize table, dataSource;

#pragma mark -
-(void)viewDidLoad {
	table.delegate = self;
	service = [[RemoteSerivce alloc] init];
	service.delegate = self;
	[service loadAllEvents];
}

#pragma mark -
#pragma mark AgendaTechClient implementation
@synthesize eventos;

-(void)didLoadEvents:(NSArray *)array {
	self.eventos = array;
	dataSource.list = self.eventos;
	//table.dataSource = dataSource;
	[table reloadData];
}

#pragma mark -
#pragma mark TableViewCellConfigurator implementation
-(UITableViewCell *)configureCell:(UITableViewCell *)cell withObject:(id)object {
	Evento *evento = (Evento *)object;
	if (evento != nil) {
		cell.textLabel.text = evento.nome;
	}
	return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate implementation
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Evento *evento = [self.eventos objectAtIndex:indexPath.row];
	
	if(detailController == nil) {
		detailController = [[Detail alloc] initWithEvento:evento];
		[detailController retain];
	} else {
		detailController.evento = evento;
	}

	[self.navigationController pushViewController:detailController animated:YES];
}

#pragma mark -
-(void) dealloc {
	self.eventos = nil;
	[detailController release];
	[super dealloc];
}

@end
