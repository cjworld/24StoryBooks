//
//  icefish_p14.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p14.h"


@implementation icefish_p14

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥躺在冰面,冷得發抖,可是冰面卻一點反應都沒有" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p14] didLoadFromCCB");
    
    animationManager = self.userObject;
}

- (void) step1
{
    CCLOG(@"[icefish_p14] step1");
    [animationManager runAnimationsForSequenceNamed:@"shake"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p14] completedAnimationSequenceNamed:%@", name);
}

@end
