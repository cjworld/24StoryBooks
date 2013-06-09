//
//  icefish_p6.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p6.h"


@implementation icefish_p6

@synthesize motherSprite;
@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"此時王祥正好進屋來" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step2) subtitle:@"你這孩子,我說過多少次一早起來就要準備好父母的早餐" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step3) subtitle:@"你怎麼就是教不會,跑去哪玩了" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"母親大人,孩兒一早起床要煮飯時發現沒柴火" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"所以上山砍材去了,讓父母擔心了" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step6) subtitle:@"既然回來了還不趕快去準備早飯" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"是,孩兒這就去" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step8) subtitle:@"" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p6] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    motherAnimationManager = motherSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p6] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"backWoodNwalk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) step2
{
    CCLOG(@"[icefish_p6] step2");
    [motherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) step3
{
    CCLOG(@"[icefish_p6] step3");
    [motherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) step6
{
    CCLOG(@"[icefish_p6] step6");
    [motherAnimationManager runAnimationsForSequenceNamed:@"talk"];
}

- (void) step8
{
    CCLOG(@"[icefish_p6] step8");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkout"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p6] completedAnimationSequenceNamed:%@", name);
}


@end
