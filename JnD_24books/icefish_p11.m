//
//  icefish_p11.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p11.h"


@implementation icefish_p11

@synthesize stoneSprite;
@synthesize wsSprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥走到結冰的湖面上,思考著該怎麼辦?" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step2) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:nil subtitle:@"王祥想到可以用石頭,看看能不能打破冰面" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step4) subtitle:@"於是王祥走過去將石頭提起" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p11] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    stoneAnimationManager = stoneSprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p11] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkby2right"];
}

- (void) step2
{
    CCLOG(@"[icefish_p11] step2");
    [animationManager runAnimationsForSequenceNamed:@"stoneFlash"];
}

- (void) step4
{
    CCLOG(@"[icefish_p11] step4");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walk2stone"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p11] completedAnimationSequenceNamed:%@", name);
    if ([name isEqual:@"walkby2right"])
    {
        [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
        [animationManager runAnimationsForSequenceNamed:@"walkby2left"];
    }
    else if ([name isEqual:@"walk2stone"])
    {
        [wsAnimationManager runAnimationsForSequenceNamed:@"benddown"];
    }
}

- (void) onTouched:(CGPoint)relative_touchLocation
{
    CCLOG(@"[icefish_p11] relative_touchLocation=(%f,%f)", relative_touchLocation.x, relative_touchLocation.y);
    if (curEventIndex == 2)
    {
        CCLOG(@"[icefish_p11] stoneSprite.boundingBox.origin=(%f,%f)", stoneSprite.boundingBox.origin.x, stoneSprite.boundingBox.origin.y);
        if (CGRectContainsPoint(stoneSprite.boundingBox, relative_touchLocation))
            [self executeNextEvent];
    }
    else
    {
        [super onTouched:relative_touchLocation];
    }
}

@end
