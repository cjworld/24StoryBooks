//
//  icefish_p13.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p13.h"


@implementation icefish_p13

@synthesize shadowSprite;
@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"失敗的王祥,煩惱著接下來該怎麼辦?" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step2) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"王祥想到用體溫,看看能不能融化冰面" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step4) subtitle:@"於是王祥走過去趴在冰上" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p13] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    shadowAnimationManager = shadowSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p13] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkby2right"];
}

- (void) step2
{
    CCLOG(@"[icefish_p13] step2");
    [animationManager runAnimationsForSequenceNamed:@"shadowFlash"];
}

- (void) step4
{
    CCLOG(@"[icefish_p13] step4");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walk2shadow"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p13] completedAnimationSequenceNamed:%@", name);
    if ([name isEqual:@"walkby2right"])
    {
        [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
        [animationManager runAnimationsForSequenceNamed:@"walkby2left"];
    }
    else if ([name isEqual:@"walk2shadow"])
    {
        [wsAnimationManager runAnimationsForSequenceNamed:@"laydown"];
    }
}

- (void) onTouched:(CGPoint)relative_touchLocation
{
    CCLOG(@"[icefish_p13] relative_touchLocation=(%f,%f)", relative_touchLocation.x, relative_touchLocation.y);
    if (curEventIndex == 2)
    {
        CCLOG(@"[icefish_p13] shadowSprite.boundingBox.origin=(%f,%f)", shadowSprite.boundingBox.origin.x, shadowSprite.boundingBox.origin.y);
        if (CGRectContainsPoint(shadowSprite.boundingBox, relative_touchLocation))
            [self executeNextEvent];
    }
    else
    {
        [super onTouched:relative_touchLocation];
    }
}

@end
