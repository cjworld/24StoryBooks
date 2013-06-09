//
//  icefish_p4.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p4.h"


@implementation icefish_p4

@synthesize wsSprite;
@synthesize tree1Sprite;
@synthesize tree2Sprite;
@synthesize tree3Sprite;

- (id) init
{
    if (self = [super init]) {
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step1) subtitle:@"王祥走進樹林" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step2) subtitle:@"砍三棵樹木吧" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step3) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step4) subtitle:@"第一顆數應聲倒下" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step5) subtitle:@"再砍一棵樹木吧" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step6) subtitle:@"" music:nil] retain]];

        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step7) subtitle:@"第二棵樹砰然倒下" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step8) subtitle:@"最後一棵樹木吧" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step9) subtitle:@"" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step10) subtitle:@"最後一棵樹也砰ㄧ聲倒下" music:nil] retain]];
        [storyEventArray addObject:[[[storyEvent alloc] init:@selector(step11) subtitle:@"木材夠多了,趕快回家煮飯吧" music:nil] retain]];
    }
    return self;
}

- (void) didLoadFromCCB
{
    CCLOG(@"[icefish_p4] didLoadFromCCB");
    
    wsAnimationManager = wsSprite.userObject;
    tree1AnimationManager = tree1Sprite.userObject;
    tree2AnimationManager = tree2Sprite.userObject;
    tree3AnimationManager = tree3Sprite.userObject;
    animationManager = self.userObject;
    animationManager.delegate = self;
}

- (void) step1
{
    CCLOG(@"[icefish_p4] step1");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walkin"];
}

- (void) step2
{
    CCLOG(@"[icefish_p4] step2");
    [animationManager runAnimationsForSequenceNamed:@"tree1Flash"];
}

- (void) step3
{
    CCLOG(@"[icefish_p4] step3");
    [wsAnimationManager runAnimationsForSequenceNamed:@"cutTree"];
    [animationManager runAnimationsForSequenceNamed:@"cutTree1"];
}

- (void) step4
{
    CCLOG(@"[icefish_p4] step4");
}

- (void) step5
{
    CCLOG(@"[icefish_p4] step5");
    [animationManager runAnimationsForSequenceNamed:@"tree2Flash"];
}

- (void) step6
{
    CCLOG(@"[icefish_p4] step6");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk_right"];
    [animationManager runAnimationsForSequenceNamed:@"walk2tree2"];
}

- (void) step7
{
    CCLOG(@"[icefish_p4] step7");
    [wsAnimationManager runAnimationsForSequenceNamed:@"cutTree"];
    [animationManager runAnimationsForSequenceNamed:@"cutTree2"];
}

- (void) step8
{
    CCLOG(@"[icefish_p4] step8");
    [animationManager runAnimationsForSequenceNamed:@"tree3Flash"];
}

- (void) step9
{
    CCLOG(@"[icefish_p4] step9");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walk2tree3"];
}

- (void) step10
{
    CCLOG(@"[icefish_p4] step10");
    [wsAnimationManager runAnimationsForSequenceNamed:@"cutTree"];
    [animationManager runAnimationsForSequenceNamed:@"cutTree3"];
}

- (void) step11
{
    CCLOG(@"[icefish_p4] step11");
    [wsAnimationManager runAnimationsForSequenceNamed:@"walk"];
    [animationManager runAnimationsForSequenceNamed:@"walk2treetrunk"];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_p4] completedAnimationSequenceNamed:%@", name);
    if ([name isEqual:@"walk2treetrunk"])
    {
        [wsAnimationManager runAnimationsForSequenceNamed:@"down2crouch"];
    }
}

- (void) onTouched:(CGPoint)relative_touchLocation
{
    CCLOG(@"[icefish_p3] relative_touchLocation=(%f,%f)", relative_touchLocation.x, relative_touchLocation.y);
    if (curEventIndex == 2)
    {
        CCLOG(@"[icefish_p3] tree1Sprite.boundingBox.origin=(%f,%f)", tree1Sprite.boundingBox.origin.x, tree1Sprite.boundingBox.origin.y);
        if (CGRectContainsPoint(tree1Sprite.boundingBox, relative_touchLocation))
            [self executeNextEvent];
    }
    else if (curEventIndex == 5)
    {
        if (CGRectContainsPoint(tree2Sprite.boundingBox, relative_touchLocation))
            [self executeNextEvent];
    }
    else if (curEventIndex == 8)
    {
        if (CGRectContainsPoint(tree3Sprite.boundingBox, relative_touchLocation))
            [self executeNextEvent];
    }
    else
    {
        [super onTouched:relative_touchLocation];
    }
}

@end
