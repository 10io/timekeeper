//
//  StopWatch.h
//  TimeKeeper
//
//  Created by David Fernandez on 15/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StopWatch : NSObject

-(id) initWithDuration: (NSTimeInterval) duration;

-(void) start;
-(void) pause;
-(void) unpause;

-(BOOL) counting;
-(BOOL) running;
-(BOOL) paused;

-(NSString*) remaining;

@end
