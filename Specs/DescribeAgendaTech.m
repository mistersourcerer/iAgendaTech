#import <Foundation/Foundation.h>
#import "UISpec.h"
#import "UIQuery.h"

@interface DescribeAgendaTech : NSObject<UISpec> {}
	UIQuery *app;
@end

@implementation DescribeAgendaTech

- (void) before {
	app = [[UIQuery withApplication] retain];
	app.timeout = 2;
}

- (void) after {
	[app release];
}

- (void) itShouldShowWelcomeScreen {
	[[app.label text:@"agendatech"] should].exist;
}

- (void) itShouldAssyncLoadTheMainEvents {
	/*
	UIQuery *tableView = app.tableView;
	int rows = [[tableView dataSource] tableView:tableView numberOfRowsInSection:0];
	[tableView.should have:be(1)];
	*/
}

@end
