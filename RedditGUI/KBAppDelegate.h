//
//  KBAppDelegate.h
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class KBWindowController;

@interface KBAppDelegate : NSObject <NSApplicationDelegate> {
    KBWindowController * windowController;
}


@property (assign) IBOutlet NSWindow *window;

@end
