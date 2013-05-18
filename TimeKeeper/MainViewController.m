//
//  MainViewController.m
//  TimeKeeper
//
//  Created by David Fernandez on 14/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import "MainViewController.h"
#import "StopWatch.h"

@interface MainViewController ()
    @property(nonatomic, strong) NSTimer *timer;
    @property(nonatomic, strong) NSDateFormatter *monthFormatter;
    @property(nonatomic, strong) NSDateFormatter *dayFormatter;
    @property(nonatomic, strong) NSDateFormatter *hourFormatter;
    @property(nonatomic, strong) StopWatch *stopWatch;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self
                                                    selector:@selector(timerFired:)
                                                    userInfo:nil
                                                     repeats:YES];
        self.monthFormatter = [[NSDateFormatter alloc] init];
        [self.monthFormatter setDateFormat:@"MMM"];
        self.dayFormatter = [[NSDateFormatter alloc] init];
        [self.dayFormatter setDateFormat:@"dd"];
        self.hourFormatter = [[NSDateFormatter alloc] init];
        [self.hourFormatter setDateFormat:@"HH:mm:ss"];
        self.stopWatch = [[StopWatch alloc] initWithDuration:(60 * 60 * 8 + 24 * 60)];
    }
    
    return self;
}

-(void)timerFired:(NSTimer*)theTimer
{
    NSDate *now = [NSDate date];
    [self.monthTextField setStringValue:[self.monthFormatter stringFromDate:now]];
    [self.dayTextField setStringValue: [self.dayFormatter stringFromDate:now]];
    [self.hourTextField setStringValue:[self.hourFormatter stringFromDate:now]];
    
    [self.remainingTextField setStringValue: [self.stopWatch remaining]];
    
    [self.startButton setHidden: true];
    [self.pauseButton setHidden: true];
    [self.unpauseButton setHidden: true];
    
    if(![self.stopWatch counting])
    {
        [self.startButton setHidden: false];
    }
    
    if([self.stopWatch running])
    {
        [self.pauseButton setHidden: false];
    }
    
    if([self.stopWatch paused])
    {
        [self.unpauseButton setHidden: false];
    }

    if([self.stopWatch fifteenMinutesRemaining]) {
        [[[NSApplication sharedApplication] dockTile] setBadgeLabel:@"15min"];
    }

    if([self.stopWatch fiveMinutesRemaining]) {
        [[[NSApplication sharedApplication] dockTile] setBadgeLabel:@"5min"];
    }
}

- (IBAction) start:(id) sender
{
    [self.stopWatch start];
}

- (IBAction) pause:(id) sender
{
    [self.stopWatch pause];
}

- (IBAction) unpause:(id) sender
{
    [self.stopWatch unpause];
}

@end
