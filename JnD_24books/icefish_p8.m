//
//  icefish_p8.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p8.h"


@implementation icefish_p8

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"一年冬天,天寒地凍,草木不生" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"王祥的後母受了風寒,在家裡休養著" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p8] didLoadFromCCB");
    
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p8] completedAnimationSequenceNamed:%@", name);
}

@end
