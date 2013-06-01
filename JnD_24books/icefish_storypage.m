//
//  icefish_storypage.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_storypage.h"

@implementation storyPage

@synthesize ccbi;
@synthesize sprite;

- (id)init:(NSString *)_ccbi
{
    if ( self = [super init] )
    {
        ccbi = _ccbi;
        sprite = nil;
    }
    return self;
}

@end

@implementation storyEvent

@synthesize subtitle;
@synthesize music;

- (id)init:(SEL)_eventHandler subtitle:(NSString *)_subtitle music:(NSString *)_music
{
    if ( self = [super init] )
    {
        eventHandler = _eventHandler;
        subtitle = _subtitle;
        music = _music;
    }
    return self;
}

@end

@implementation icefish_storypage

- (void) didLoadFromCCB {
    pageIndex = 0;
    
    storyEventArray = [[NSMutableArray alloc] init];
    
    storyPageArray = [[NSMutableArray alloc] init];
    
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p1.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p2.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p3.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p4.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p5.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p6.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p7.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p8.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p9.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p10.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p11.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p12.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p13.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p14.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p15.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p16.ccbi"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p17.ccbi"] retain]];
    
    for (storyPage *page in storyPageArray) {
        CCSprite *pageSprite = (CCSprite *)[CCBReader nodeGraphFromFile:page.ccbi owner:self];
        pageSprite.visible = NO;
        pageSprite.position = ccp(0, -20);
        [storyContentLayer addChild:pageSprite];
        page.sprite = pageSprite;
    }

    storyPage *firstpage = [storyPageArray objectAtIndex:0];
    CCSprite *firstsprite = firstpage.sprite;
    firstsprite.visible = YES;
    
    animationManager = self.userObject;
    animationManager.delegate = self;
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
        storyPage *curpage = [storyPageArray objectAtIndex:pageIndex];
        storyPage *prepage = [storyPageArray objectAtIndex:--pageIndex];
        CCSprite *cursprite = curpage.sprite;
        CCSprite *presprite = prepage.sprite;
        cursprite.visible = NO;
        presprite.visible = YES;
    }
}

- (void) onNextPageBtnPressed:(id)sender
{
    if (pageIndex < [storyPageArray count] - 1)
    {
        storyPage *curpage = [storyPageArray objectAtIndex:pageIndex];
        storyPage *nextpage = [storyPageArray objectAtIndex:++pageIndex];
        CCSprite *cursprite = curpage.sprite;
        CCSprite *nextsprite = nextpage.sprite;
        cursprite.visible = NO;
        nextsprite.visible = YES;
    }
}

- (void) onPauseBtnPressed:(id)sender
{
    btnMenu.enabled = NO;
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
    storyContentLayer.visible = YES;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{

}

@end
