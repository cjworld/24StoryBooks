//
//  icefish_p2.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p2.h"


@implementation icefish_p2

@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"雖然王祥對後母很孝順,但是後母對王祥是非常刻薄" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p2] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
    wsAnimationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p2] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p2] completedAnimationSequenceNamed:%@", name);
    if ([name isEqual:@"walkin"])
        [wsAnimationManager runAnimationsForSequenceNamed:@"down2crouch"];
}

@end
