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

    -(NSTimeInterval) remainingInSeconds;
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
        [self.hourFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
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

-(BOOL) fifteenMinutesRemaining
{
    if([self counting])
    {
        return [self remainingInSeconds] < 60 * 15;
    }
    
    return false;
}

-(BOOL) fiveMinutesRemaining
{
    if([self counting])
    {
        return [self remainingInSeconds] < 60 * 5;
    }
    
    return false;
}

-(NSString*) remaining
{
    if (!self.counting)
    {
        return @"00:00:00";
    }
    
    NSTimeInterval seconds = [self remainingInSeconds];
    
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

-(NSTimeInterval) remainingInSeconds
{
    NSTimeInterval remaining = self.duration - [[NSDate date] timeIntervalSince1970] + [self.startDate timeIntervalSince1970];
    
    if (self.paused)
    {
        remaining = self.duration - [self.stopDate timeIntervalSince1970] + [self.startDate timeIntervalSince1970];
    }
    
    return remaining;
}

@end
