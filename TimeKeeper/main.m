//
//  main.m
//  TimeKeeper
//
//  Created by David Fernandez on 04/05/2013.
//  Copyright (c) 2013 David Fernandez. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <MacRuby/MacRuby.h>

int main(int argc, char *argv[])
{
    return macruby_main("rb_main.rb", argc, argv);
}
