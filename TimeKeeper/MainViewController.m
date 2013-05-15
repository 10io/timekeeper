//
//  MainViewController.m
//  TimeKeeper
//
//  Created by David Fernandez on 14/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
    @property(nonatomic, strong) NSTimer *timer;
    @property(nonatomic, strong) NSDateFormatter *dateFormatter;
    @property(nonatomic, strong) NSDateFormatter *hourFormatter;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5
                                                      target:self selector:@selector(timerFired:)
                                                    userInfo:nil repeats:YES];
        self.dateFormatter = [[NSDateFormatter alloc] init];
        [self.dateFormatter setDateFormat:@"dd-MM-yyyy"];
        self.hourFormatter = [[NSDateFormatter alloc] init];
        [self.hourFormatter setDateFormat:@"HH:mm:ss"];
    }
    
    return self;
}

-(void)timerFired:(NSTimer*)theTimer
{
    NSDate *now = [NSDate date];
    [self.dateTextField setStringValue:[self.dateFormatter stringFromDate:now]];
    [self.hourTextField setStringValue:[self.hourFormatter stringFromDate:now]];
}

@end
