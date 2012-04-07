//
//  KBWindowController.h
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KBWindowController : NSWindowController {
    IBOutlet NSView     *targetView;				// the host view
	NSViewController	*currentViewController;     // the current view controller
}

- (void)changeViewController:(int)view;
@end
