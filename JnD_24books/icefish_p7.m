//
//  icefish_p7.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p7.h"


@implementation icefish_p7

@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥被澆了一盤冷水, 心裡十分難過" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step2) subtitle:@"但是仍然聽話的繼續準備父母的早餐" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p7] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p7] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) step2
{
    CCLOG(@"[icefish_p7] step2");
    [wsAnimationManager runAnimationsForSequenceNamed:@"benddown"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p7] completedAnimationSequenceNamed:%@", name);
}


@end
