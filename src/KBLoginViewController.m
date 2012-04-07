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
    // 
    [[self view] removeFromSuperview];
    [[self windowController] changeViewController:kRedditView];
}

@end
