//
//  iAgendaTechAppDelegate.h
//  iAgendaTech
//
//  Created by Ricardo on 2/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iAgendaTechViewController;

@interface iAgendaTechAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iAgendaTechViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iAgendaTechViewController *viewController;

@end

