//
//  icefish_p9.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p9.h"


@implementation icefish_p9

@synthesize motherSprite;
@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥端著飯菜進來" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"母親,喝些粥吧,這樣身體比較有元氣" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step3) subtitle:@"每天吃粥,都沒胃口了,咳咳,好想念新鮮的魚阿" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"孩兒這就去找" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step5) subtitle:@"" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p9] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    motherAnimationManager = motherSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p9] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) step3
{
    CCLOG(@"[icefish_p9] step3");
}

- (void) step5
{
    CCLOG(@"[icefish_p9] step5");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkout"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p9] completedAnimationSequenceNamed:%@", name);
    if ([name isEqual:@"walkin"])
        [wsAnimationManager runAnimationsForSequenceNamed:@"down2crouch"];
}


@end
