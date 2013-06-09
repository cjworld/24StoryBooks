//
//  icefish_storypage.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_storypage.h"

#define kStoryReading 1
#define kStoryPausing 2

@implementation icefish_storypage

- (void) didLoadFromCCB {
    
    CCLOG(@"[icefish_storypage] didLoadFromCCB");
    pageIndex = 0;
    storyContentArray = [[NSMutableArray alloc] init];
    [storyContentArray addObject:(icefish_storycontent *)[CCBReader nodeGraphFromFile:@"icefish_p1.ccbi"]];
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
        pageSprite.subtitleLbl = subtitleLbl;
        pageSprite.visible = NO;
        pageSprite.position = ccp(0, -20);
        pageSprite.icefishStoryContentDelegate = self;
        [storyContentLayer addChild:pageSprite];
    }
    
    icefish_storycontent *firstsprite = [storyContentArray objectAtIndex:pageIndex];
    firstsprite.visible = YES;
    
    animationManager = self.userObject;
    animationManager.delegate = self;
    
    pauseMenu.enabled = NO;
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
    storyState = kStoryReading;
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
        presprite.curEventIndex = 0;
        [animationManager runAnimationsForSequenceNamed:@"Default Timeline"];
        [presprite executeNextEvent];
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
        nextsprite.curEventIndex = 0;
        [animationManager runAnimationsForSequenceNamed:@"Default Timeline"];
        [nextsprite executeNextEvent];
    }
}

- (void) onPauseBtnPressed:(id)sender
{
    btnMenu.enabled = NO;
    pauseMenu.enabled = YES;
    storyContentLayer.visible = NO;
    
    storyState = kStoryPausing;
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
    
    storyState = kStoryReading;
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"[icefish_storypage] ccTouchBegan with state=%d", storyState);
    
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    if (storyState == kStoryReading)
    {
        subtitleLbl.string = @"";
        icefish_storycontent *curStoryContent = [storyContentArray objectAtIndex:pageIndex];
        
        CGPoint relative_touchLocation = ccpSub(touchLocation, storyContentLayer.position);
        relative_touchLocation = ccp(relative_touchLocation.x + curStoryContent.boundingBox.size.width/2, relative_touchLocation.y + curStoryContent.boundingBox.size.height/2);
        [curStoryContent onTouched:relative_touchLocation];
    }
    return TRUE;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"[icefish_storypage] completedAnimationSequenceNamed:%@", name);
}

- (void) flashNextPageBtn
{
    [animationManager runAnimationsForSequenceNamed:@"nextPageBtnFlash"];
}

@end
