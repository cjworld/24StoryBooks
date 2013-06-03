//
//  icefish_storycontent.m
//  JnD_24books
//
//  Created by Jerry on 13/6/3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_storycontent.h"

@implementation storyEvent

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

- (void) didLoadFromCCB
{

}

@end
