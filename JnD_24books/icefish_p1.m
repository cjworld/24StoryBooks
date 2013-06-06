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

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p1] didLoadFromCCB");
}

- (void) onEnter
{
    [super onEnter];
    CCLOG(@"[icefish_p1] onEnter");
    animationManager2 = wsSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
    [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"嘿嘿我跳進來惹" music:nil] retain]];
    [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"揍我啊笨蛋" music:nil] retain]];
    [self executeNextEvent];
}

- (void) step1
{
    CCLOG(@"step1");
    [animationManager2 runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    //[self executeNextEvent];
}

@end
