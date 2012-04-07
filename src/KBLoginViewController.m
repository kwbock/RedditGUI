//
//  KBLoginViewController.m
//  RedditGUI
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KBLoginViewController.h"
#import "KBRedditSplitViewController.h"
#import "KBWindowController.h"


@implementation KBLoginViewController

@synthesize windowController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

#pragma mark - Actions
- (void)login:(id)sender
{
    //KBRedditSplitViewController * redditViewController = [[KBRedditSplitViewController alloc] initWithNibName:@"RedditSplitView" bundle:nil];
    //[[[self view] superview] addSubview:[redditViewController view]];
    //[[self view] superview]
    [[self view] removeFromSuperview];
    [[self windowController] changeViewController:kRedditView];
}

@end
