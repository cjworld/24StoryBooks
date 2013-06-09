//
//  icefish_p5.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p5.h"


@implementation icefish_p5

@synthesize fatherSprite;
@synthesize motherSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step2) subtitle:@"這孩子一大早起床就不見人,怎麼沒有準備早餐" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step3) subtitle:@"真是越來越不把我們放在眼裡了" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step4) subtitle:@"孩子很乖的,他一定是有事情去忙了" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step5) subtitle:@"最好是這樣,等等回來讓我好好問問他" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p5] didLoadFromCCB");
    
    fatherAnimationManager = fatherSprite.userObject;
    motherAnimationManager = motherSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) onEnter
{
    CCLOG(@"[icefish_p5] onEnter");
    [super onEnter];
}

- (void) step1
{
    CCLOG(@"[icefish_p5] step1");
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) step2
{
    CCLOG(@"[icefish_p5] step2");
    [motherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) step3
{
    CCLOG(@"[icefish_p5] step3");
    [motherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) step4
{
    CCLOG(@"[icefish_p5] step4");
    [fatherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) step5
{
    CCLOG(@"[icefish_p5] step5");
    [motherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p5] completedAnimationSequenceNamed:%@", name);
}

@end
