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

NSString *const kLoginTitle		= @"LoginView";
NSString *const kRedditTitle    = @"RedditSplitView";

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
    // TODO: add ability to store login in keychain/somewhere else
    //load the login view on initial load
    KBLoginViewController* loginViewController =
    [[KBLoginViewController alloc] initWithNibName:kLoginTitle bundle:nil];
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

@end
