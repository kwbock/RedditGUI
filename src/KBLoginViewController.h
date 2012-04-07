//
//  KBLoginViewController.h
//  GUITest
//
//  Created by Kyle Bock on 4/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface KBLoginViewController : NSViewController {
    IBOutlet NSTextField        *userName;
    IBOutlet NSSecureTextField  *password;
}

- (IBAction)login:(id)sender;

@end
