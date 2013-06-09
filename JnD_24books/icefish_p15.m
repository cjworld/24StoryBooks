//
//  icefish_p15.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p15.h"


@implementation icefish_p15

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"此時神奇的事情發生了" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"王祥旁邊的湖面自動裂開來,蹦出了兩條鯉魚" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"原來是王祥的孝心感動天,上天決定幫他一把" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p15] didLoadFromCCB");
    
    animationManager = self.userObject;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p15] completedAnimationSequenceNamed:%@", name);
}

@end
