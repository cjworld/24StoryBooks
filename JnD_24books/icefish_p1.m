//
//  icefish_p1.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p1.h"


@implementation icefish_p1

@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥,春秋戰國晉國人,從小喪母" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"母親過世之後,父親再娶,由後母扶養著" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p1] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p1] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p1] completedAnimationSequenceNamed:%@", name);
}

@end
