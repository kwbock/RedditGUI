//
//  KBRedditSplitViewController.m
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KBRedditSplitViewController.h"

#import "KBSidebarTableCellView.h"

@implementation KBRedditSplitViewController

@synthesize redditEngine;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // The array determines our order
        //_topLevelItems = [[NSArray arrayWithObjects:@"Favorites", @"Content Views", @"Mailboxes", @"A Fourth Group", nil] retain];
        _topLevelItems = [NSArray arrayWithObjects:@"Subreddits", nil];
        
        _childrenDictionary = [NSMutableDictionary new];
        [_childrenDictionary setObject:[NSMutableArray arrayWithObjects:@"r/battlefield3", nil] forKey:@"Subreddits"];
        
        [_sidebarOutlineView sizeLastColumnToFit];
        [_sidebarOutlineView reloadData];
        [_sidebarOutlineView setFloatsGroupRows:NO];
        
        // NSTableViewRowSizeStyleDefault should be used, unless the user has picked an explicit size. In that case, it should be stored out and re-used.
        [_sidebarOutlineView setRowSizeStyle:NSTableViewRowSizeStyleDefault];
        
        // Expand all the root items; disable the expansion animation that normally happens
        [NSAnimationContext beginGrouping];
        [[NSAnimationContext currentContext] setDuration:0];
        [_sidebarOutlineView expandItem:nil expandChildren:YES];
        [NSAnimationContext endGrouping];
    }
    
    return self;
}

- (void)outlineViewSelectionDidChange:(NSNotification *)notification {
    
    // TODO: this is where we load the nib based on the reddit data
    
    //this will properly switch views, add another check to check to make sure it's a child
    if ([_sidebarOutlineView selectedRow] != -1) {
        NSString *item = [_sidebarOutlineView itemAtRow:[_sidebarOutlineView selectedRow]];
        if ([_sidebarOutlineView parentForItem:item] != nil) {
            // [self _setContentViewToName:@"SubredditView"];
        } else {
            // [self _setContentViewToName:nil];
        }
    }
}

- (NSArray *)_childrenForItem:(id)item {
    NSArray *children;
    if (item == nil) {
        children = _topLevelItems;
    } else {
        children = [_childrenDictionary objectForKey:item];
    }
    return children;    
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    NSLog(@"here");
    return [[self _childrenForItem:item] objectAtIndex:index];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if ([outlineView parentForItem:item] == nil) {
        return YES;
    } else {
        return NO;
    }    
}

- (NSInteger) outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    return [[self _childrenForItem:item] count];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(id)item {
    return [_topLevelItems containsObject:item];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldShowOutlineCellForItem:(id)item {
    // As an example, hide the "outline disclosure button" for FAVORITES. This hides the "Show/Hide" button and disables the tracking area for that row.
    if ([item isEqualToString:@"Favorites"]) {
        return NO;
    } else {
        return YES;
    }
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item {
    // For the groups, we just return a regular text view. 
    if ([_topLevelItems containsObject:item]) {
        NSTextField *result = [outlineView makeViewWithIdentifier:@"HeaderTextField" owner:self];
        // Uppercase the string value, but don't set anything else. NSOutlineView automatically applies attributes as necessary
        NSString *value = [item uppercaseString];
        [result setStringValue:value];
        return result;
    } else  {
        // The cell is setup in IB. The textField and imageView outlets are properly setup.
        // Special attributes are automatically applied by NSTableView/NSOutlineView for the source list
        KBSidebarTableCellView *result = [outlineView makeViewWithIdentifier:@"MainCell" owner:self];
        result.textField.stringValue = item;
        // Setup the icon based on our section
        id parent = [outlineView parentForItem:item];
        NSInteger index = [_topLevelItems indexOfObject:parent];
        result.imageView.image = nil;
        BOOL hideUnreadIndicator = YES;
        // Setup the unread indicator to show in some cases. Layout is done in SidebarTableCellView's viewWillDraw
        if (index == 0) {
            // First row in the index
            hideUnreadIndicator = YES;
            [result.button setTitle:@"42"];
            [result.button sizeToFit];
            // Make it appear as a normal label and not a button
            [[result.button cell] setHighlightsBy:0];
        } else if (index == 2) {
            // Example for a button
            hideUnreadIndicator = NO;
            result.button.target = self;
            result.button.action = @selector(buttonClicked:);
            [result.button setImage:[NSImage imageNamed:NSImageNameAddTemplate]];
            // Make it appear as a button
            [[result.button cell] setHighlightsBy:NSPushInCellMask|NSChangeBackgroundCellMask];
        }
        [result.button setHidden:hideUnreadIndicator];
        return result;
    }
}

#pragma mark - Split View methods
- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview {
    return NO;
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex {
    if (proposedMinimumPosition < 75) {
        proposedMinimumPosition = 75;
    }
    return proposedMinimumPosition;
}

@end
