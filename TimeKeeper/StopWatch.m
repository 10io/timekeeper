//
//  StopWatch.m
//  TimeKeeper
//
//  Created by David Fernandez on 15/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import "StopWatch.h"

typedef enum {
    kNotRunning,
    kRunning,
    kPaused
} StopWatchStateType;

@interface StopWatch ()
    @property(nonatomic, assign) StopWatchStateType state;
    @property(nonatomic, assign) NSTimeInterval duration;
    @property(nonatomic, strong) NSDate *startDate;
    @property(nonatomic, strong) NSDate *stopDate;
@property(nonatomic, strong) NSDateFormatter* hourFormatter;
@end

@implementation StopWatch

-(id) initWithDuration: (NSTimeInterval) duration
{
    if (self = [super init])
    {
        self.duration = duration;
        self.state = kNotRunning;
        self.hourFormatter = [[NSDateFormatter alloc] init];
        [self.hourFormatter setDateFormat:@"HH:mm:ss"];
    }
    
    return self;
}

-(void) start
{
    self.startDate = [NSDate date];
    self.state = kRunning;
}

-(void) pause
{
    self.stopDate = [NSDate date];
    self.state = kPaused;
}

-(void) unpause
{
    self.stopDate = nil;
    self.state = kRunning;
}

-(NSString*) remaining
{
    if (!self.counting)
    {
        return @"00:00:00";
    }
    
    NSTimeInterval seconds = self.duration - [[NSDate date] timeIntervalSince1970] + [self.startDate timeIntervalSince1970];
    
    if (self.paused)
    {
        seconds = self.duration - [self.stopDate timeIntervalSince1970] + [self.startDate timeIntervalSince1970];
    }
    
    return [self.hourFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:seconds]];
}

-(BOOL) counting
{
    return self.state == kRunning || self.state == kPaused;
}

-(BOOL) running
{
    return self.state == kRunning;
}

-(BOOL) paused
{
    return self.state == kPaused;
}


@end
