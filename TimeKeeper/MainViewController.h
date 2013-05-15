//
//  MainViewController.h
//  TimeKeeper
//
//  Created by David Fernandez on 14/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController

@property (nonatomic, strong) IBOutlet NSTextField *dateTextField;
@property (nonatomic, strong) IBOutlet NSTextField *hourTextField;
@property (nonatomic, strong) IBOutlet NSTextField *remainingTextField;

@end
