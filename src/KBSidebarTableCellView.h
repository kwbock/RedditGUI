//
//  KBSidebarTableCellView.h
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KBSidebarTableCellView : NSTableCellView {
@private
    NSButton *_button;
}

@property(retain) IBOutlet NSButton *button;

@end
