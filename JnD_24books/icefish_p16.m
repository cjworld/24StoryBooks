//
//  icefish_p16.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p16.h"


@implementation icefish_p16

@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥抱著得來不易的兩條魚,拼命的跑回家" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p16] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p16] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"holdNwalk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p16] completedAnimationSequenceNamed:%@", name);
}

@end
