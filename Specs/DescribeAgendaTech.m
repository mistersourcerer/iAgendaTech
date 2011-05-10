#import <Foundation/Foundation.h>
#import "UISpec.h"
#import "UIQuery.h"

@interface DescribeAgendaTech : NSObject<UISpec> {}
	UIQuery *app;
@end

@implementation DescribeAgendaTech

- (void) before {
	app = [[UIQuery withApplication] retain];
}

- (void) after {
	[app release];
}

- (void) itShouldShowWelcomeScreen {
	[[app.label text:@"agendatech"] should].exist;
}

@end
