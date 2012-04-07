//
//  KBAppDelegate.m
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KBAppDelegate.h"
#import "KBWindowController.h"

@implementation KBAppDelegate

@synthesize window = _window;

- (IBAction)newDocument:(id)sender
{
    if (windowController == NULL)
		windowController = [[KBWindowController alloc] initWithWindowNibName:@"MainWindow"];
	
	[windowController showWindow:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self newDocument:self];
}

@end
