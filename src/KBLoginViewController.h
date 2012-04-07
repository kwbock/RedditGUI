//
//  KBLoginViewController.h
//  GUITest
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class KBWindowController;

@interface KBLoginViewController : NSViewController {
    IBOutlet NSTextField        *userName;
    IBOutlet NSSecureTextField  *password;
    
    KBWindowController * windowController;
}

@property KBWindowController *windowController;

- (IBAction)login:(id)sender;

@end
