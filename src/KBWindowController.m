//
//  KBWindowController.m
//  GUITest
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KBWindowController.h"
#import "KBLoginViewController.h"
#import "KBRedditSplitViewController.h"

@implementation KBWindowController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    KBLoginViewController* loginViewController =
    [[KBLoginViewController alloc] initWithNibName:kLoginViewNibName bundle:nil];
    [loginViewController setWindowController:self];
    if (loginViewController != nil)
    {
        currentViewController = loginViewController;	// keep track of the current view controller
        [currentViewController setTitle:kLoginTitle];
    }
    
    // embed the current view to our host view
	[targetView addSubview: [currentViewController view]];
	
	// make sure we automatically resize the controller's view to the current window size
	[[currentViewController view] setFrame: [targetView bounds]];
}

- (void)changeViewController:(int)view
{
    switch (view) {
        case kLoginView:
            currentViewController = [[KBLoginViewController alloc] initWithNibName:kLoginViewNibName bundle:nil];
            [(KBLoginViewController*)currentViewController setWindowController:self];
            [currentViewController setTitle:kLoginTitle];
            break;
        case kRedditView:
            NSLog(@"reddit view called");
            currentViewController = [[KBRedditSplitViewController alloc] initWithNibName:kRedditViewNibName bundle:nil];
            [currentViewController setTitle:kRedditTitle];
            break;
        default:
            break;
    }
    //sets it to pin to sides for resizing
    NSView *newView = [currentViewController view];
    [newView setAutoresizingMask:NSViewWidthSizable | NSViewHeightSizable];
    // embed the current view to our host view
    [targetView addSubview: newView];
    
    // make sure we automatically resize the controller's view to the current window size
    [[currentViewController view] setFrame: [targetView bounds]];
}

@end
