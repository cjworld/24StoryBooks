//
//  icefish_p17.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p17.h"


@implementation icefish_p17

@synthesize motherSprite;
@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥全身發抖,抱著兩條魚拿給媽媽" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"後母知道王祥竟然是這樣為了自己犧牲,大大的受到感動" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"從此將王祥視為己出,全家人和樂融融的在一起" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p17] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p17] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"holdNwalk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p17] completedAnimationSequenceNamed:%@", name);
    if ([name isEqual:@"walkin"])
        [wsAnimationManager runAnimationsForSequenceNamed:@"down2crouch"];
}
@end
