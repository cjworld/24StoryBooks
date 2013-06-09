//
//  icefish_p3.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p3.h"


@implementation icefish_p3

@synthesize wsSprite;
@synthesize axSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"父母還沒起床,先把早餐準備好吧! " music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step3) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"木柴不夠了,不能煮飯怎麼辦呢？" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step5) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step6) subtitle:@"王祥拿起起了斧頭,往山上走去" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p3] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    axAnimationManager = axSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p3] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) step3
{
    CCLOG(@"[icefish_p3] step3");
    [wsAnimationManager runAnimationsForSequenceNamed:@"benddown"];
}

- (void) step5
{
    CCLOG(@"[icefish_p3] step5");
    [animationManager runAnimationsForSequenceNamed:@"axFlash"];
}

- (void) step6
{
    CCLOG(@"[icefish_p3] step6");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walkout"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p3] completedAnimationSequenceNamed:%@", name);
}

- (void) onTouched:(CGPoint)relative_touchLocation
{
    if (curEventIndex == 5)
    {
        if (CGRectContainsPoint(axSprite.boundingBox, relative_touchLocation))
            [self executeNextEvent];
    }
    else
    {
        [super onTouched:relative_touchLocation];
    }
}

@end
