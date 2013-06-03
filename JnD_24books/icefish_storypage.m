//
//  icefish_storypage.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_storypage.h"

@implementation icefish_storypage

- (void) didLoadFromCCB {
    pageIndex = 0;
    
    storyEventArray = [[NSMutableArray alloc] init];
    
    storyContentArray = [[NSMutableArray alloc] init];
    
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p1.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p2.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p3.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p4.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p5.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p6.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p7.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p8.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p9.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p10.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p11.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p12.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p13.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p14.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p15.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p16.ccbi" owner:self]];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p17.ccbi" owner:self]];
    
    for (icefish_storycontent *pageSprite in storyContentArray) {
        pageSprite.visible = NO;
        pageSprite.position = ccp(0, -20);
        [storyContentLayer addChild:pageSprite];
    }

    icefish_storycontent *firstsprite = [storyContentArray objectAtIndex:0];
    firstsprite.visible = YES;
    
    animationManager = self.userObject;
    animationManager.delegate = self;
    
    pauseMenu.enabled = NO;
}

- (void) onEnterTransitionDidFinish
{

}

- (void) onExitTransitionDidStart
{
    
}

- (void) onMuteBtnPressed:(id)sender
{
    
}

- (void) onPrePageBtnPressed:(id)sender
{
    if (pageIndex >= 1)
    {
        icefish_storycontent *cursprite = [storyContentArray objectAtIndex:pageIndex];
        icefish_storycontent *presprite = [storyContentArray objectAtIndex:--pageIndex];
        cursprite.visible = NO;
        presprite.visible = YES;
    }
}

- (void) onNextPageBtnPressed:(id)sender
{
    if (pageIndex < [storyContentArray count] - 1)
    {
        icefish_storycontent *cursprite = [storyContentArray objectAtIndex:pageIndex];
        icefish_storycontent *nextsprite = [storyContentArray objectAtIndex:++pageIndex];
        cursprite.visible = NO;
        nextsprite.visible = YES;
    }
}

- (void) onPauseBtnPressed:(id)sender
{
    btnMenu.enabled = NO;
    pauseMenu.enabled = YES;
    storyContentLayer.visible = NO;
}

- (void) onHomeBtnPressed:(id)sender
{
    CCNode *sc = [CCBReader nodeGraphFromFile:@"gameMenu_s1.ccbi"];
    CCScene *scene = [CCScene node];
    [scene addChild: sc];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) onResumeBtnPressed:(id)sender
{
    btnMenu.enabled = YES;
    pauseMenu.enabled = NO;
    storyContentLayer.visible = YES;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{

}

@end
