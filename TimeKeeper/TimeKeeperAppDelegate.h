//
//  TimeKeeperAppDelegate.h
//  TimeKeeper
//
//  Created by David Fernandez on 14/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainViewController.h"

@interface TimeKeeperAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) IBOutlet MainViewController *mainViewController;

@end
