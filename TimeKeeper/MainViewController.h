//
//  MainViewController.h
//  TimeKeeper
//
//  Created by David Fernandez on 14/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController

@property (nonatomic, strong) IBOutlet NSTextField *monthTextField;
@property (nonatomic, strong) IBOutlet NSTextField *dayTextField;
@property (nonatomic, strong) IBOutlet NSTextField *hourTextField;
@property (nonatomic, strong) IBOutlet NSTextField *remainingTextField;

@property (nonatomic, strong) IBOutlet NSButton *startButton;
@property (nonatomic, strong) IBOutlet NSButton *pauseButton;
@property (nonatomic, strong) IBOutlet NSButton *unpauseButton;

- (IBAction) start:(id) sender;
- (IBAction) pause:(id) sender;
- (IBAction) unpause:(id) sender;

- (NSMenu *)applicationDockMenu;
@end
