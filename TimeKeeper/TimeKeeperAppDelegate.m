//
//  TimeKeeperAppDelegate.m
//  TimeKeeper
//
//  Created by David Fernandez on 14/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import "TimeKeeperAppDelegate.h"

@implementation TimeKeeperAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    [self.window.contentView addSubview:self.mainViewController.view];
    self.mainViewController.view.frame = ((NSView*)self.window.contentView).bounds;
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)application
{
    return YES;
}

@end
