//
//  icefish_storycontent.m
//  JnD_24books
//
//  Created by Jerry on 13/6/3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_storycontent.h"

@implementation storyEvent

@synthesize eventHandler;
@synthesize subtitle;
@synthesize music;

- (id)init:(SEL)_eventHandler subtitle:(NSString *)_subtitle music:(NSString *)_music
{
    if ( self = [super init] )
    {
        eventHandler = _eventHandler;
        subtitle = _subtitle;
        music = _music;
    }
    return self;
}

@end

@implementation icefish_storycontent

@synthesize subtitleLbl;
@synthesize curEventIndex;

- (id)init
{
    if ( self = [super init] )
    {
        storyEventArray = [[NSMutableArray alloc] init];
        storySoundArray = [[NSMutableArray alloc] init];
        curEventIndex = 0;
        CCLOG(@"[icefish_storycontent] init");
    }
    return self;
}

- (void) setSubtitle:(NSString *)subtitle
{
    subtitleLbl.string = subtitle;
}

- (void) executeNextEvent
{
    CCLOG(@"[icefish_storycontent] executeNextEvent");
    if ([storyEventArray count] > curEventIndex)
    {
        storyEvent *nextEvent = [storyEventArray objectAtIndex:curEventIndex];
        [self setSubtitle:nextEvent.subtitle];
        if (nextEvent.eventHandler != nil)
            [self performSelector:nextEvent.eventHandler];
        curEventIndex ++;
    }
}

@end
