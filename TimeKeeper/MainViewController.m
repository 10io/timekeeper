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
    @property(nonatomic, strong) NSDateFormatter *dateFormatter;
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
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"dd-MM-yyyy"];
        self.hourFormatter = [[NSDateFormatter alloc] init];
        [self.hourFormatter setDateFormat:@"HH:mm:ss"];
        self.stopWatch = [[StopWatch alloc] initWithDuration:(60 * 60 * 8 + 24 * 60)];
    }
    
    return self;
}

-(void)timerFired:(NSTimer*)theTimer
{
    NSDate *now = [NSDate date];
    [self.dateTextField setStringValue:[self.dateFormatter stringFromDate:now]];
    [self.hourTextField setStringValue:[self.hourFormatter stringFromDate:now]];
    
    NSMutableString *remainingText = [[NSMutableString alloc] initWithString:[self.stopWatch remaining]];
    if ([self.stopWatch paused])
    {
        [remainingText appendString:@" (Paused)"];
    }
    [self.remainingTextField setStringValue:remainingText];
    
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
