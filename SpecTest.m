//
//  SpecTest.m
//  AgendaTechClient
//
//  Created by Ricardo Valeriano dos Santos on 12/1/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SpecTest.h"


@implementation SpecTest

#if USE_APPLICATION_UNIT_TEST     // all code under test is in the iPhone Application

- (void) testAppDelegate {
    
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIApplication failed to find the AppDelegate");
    
}

#else                           // all code under test must be linked into the Unit Test bundle

- (void) testMath {
    
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
    
}


#endif


@end
