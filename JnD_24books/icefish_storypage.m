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
@synthesize subtitle;

- (id)init:(NSString *)_ccbi subtitle:(NSString *)_subtitle
{
    if ( self = [super init] )
    {
        ccbi = _ccbi;
        subtitle = _subtitle;
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
    
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p1.ccbi" subtitle:@"王祥,晉朝人.幼時喪母,父親再娶."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p2.ccbi" subtitle:@"雖然王祥相當孝順,但後母依然十分苛刻."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p3.ccbi" subtitle:@"一日早上,王祥要做早餐,木材卻沒了."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p4.ccbi" subtitle:@"王祥立刻上山砍材去."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p5.ccbi" subtitle:@"但是母親起床後不見王祥,不悅的在父親前數落了王祥一番."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p6.ccbi" subtitle:@"王祥抱著木材回來,後母看到後只冷冷地吩咐王祥去做事"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p7.ccbi" subtitle:@"王祥雖然有些沮喪,仍然聽話地把早餐完成."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p8.ccbi" subtitle:@"一年冬天天寒地凍,後母受了風寒在屋裡休養."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p9.ccbi" subtitle:@"王祥辛勤的照顧著後母,後母卻表示自己想吃鯉魚"] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p10.ccbi" subtitle:@"孝順的王祥立馬起身前去尋找鯉魚."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p11.ccbi" subtitle:@"可是湖面結冰,如何是好."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p12.ccbi" subtitle:@"王祥想砸石頭打破冰面,卻失敗了."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p13.ccbi" subtitle:@"降下的雪落到王祥身上融化了."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p14.ccbi" subtitle:@"於是王祥將身子趴在冰上想要融化冰面."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p15.ccbi" subtitle:@"此時神奇的事情發生了,兩隻鯉魚跳了出來."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p16.ccbi" subtitle:@"開心的王祥於是抱著兩隻鯉魚回家去."] retain]];
    [storyPageArray addObject:[[[storyPage alloc] init:@"icefish_p17.ccbi" subtitle:@"回家後,後母被王祥的孝行感動不已,於是從此將王祥視為己出."] retain]];
    
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
    [storySubLbl setString:firstpage.subtitle];
    
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
        [storySubLbl setString:prepage.subtitle];
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
        [storySubLbl setString:nextpage.subtitle];
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
