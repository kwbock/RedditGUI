//
//  KBRedditSplitViewController.h
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class KBRedditEngine;

@interface KBRedditSplitViewController : NSViewController <NSOutlineViewDelegate, NSOutlineViewDataSource> {
    
    NSArray *_topLevelItems;
    NSMutableDictionary *_childrenDictionary;
    IBOutlet NSOutlineView *_sidebarOutlineView;
    
    __weak KBRedditEngine * redditEngine;
}

@property (weak) KBRedditEngine * redditEngine;

@end
