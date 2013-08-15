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
    @property(nonatomic, assign) NSTimeInterval timerStartedAt;
    @property(nonatomic, strong) NSDateFormatter* hourFormatter;
    @property(nonatomic, strong) NSTimer* timer;
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
    self.state = kRunning;
    self.timerStartedAt = [NSDate timeIntervalSinceReferenceDate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void) pause
{
    [self.timer invalidate];
    self.timer = nil;
    self.state = kPaused;
}

-(void) unpause
{
    self.state = kRunning;
    self.timerStartedAt = [NSDate timeIntervalSinceReferenceDate];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
}

-(void)timerFired:(NSTimer*)theTimer
{
    self.duration -= 1;
}

-(BOOL) fifteenMinutesRemaining
{
    if([self counting] && self.duration >= 0)
    {
        return self.duration < 60 * 15;
    }
    
    return false;
}

-(BOOL) fiveMinutesRemaining
{
    if([self counting] && self.duration >= 0)
    {
        return self.duration < 60 * 5;
    }
    
    return false;
}

-(NSString*) remaining
{
    if (!self.counting)
    {
        return @"00:00:00";
    }
    
    if (self.duration >= 0)
    {
        return [self.hourFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:self.duration]];
    }
    else {
        NSTimeInterval seconds = fabs([self duration]);
        NSMutableString* result = [[NSMutableString alloc] initWithString: @"+"];
        [result appendString:[self.hourFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:seconds]]];
        return result;
    }
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
