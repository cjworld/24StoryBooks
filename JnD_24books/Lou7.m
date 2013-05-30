//
//  Lou7.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou7.h"

@implementation Lou7

- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
    
    previousPageCCBI = @"Lou6.ccbi";
    nextPageCCBI = nil;
    backgroundMusic = @"pray.mp3";
    
    [self setFlipBtns:YES enableNextBtn:YES];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"AnimationComplate");
    if ([name isEqual: @"end"]) {
        CCLOG(@"end");
        storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP7end.mp3"];
    }else{
        CCLOG(@"other");
        storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP7.mp3"];
        [self showFlipBtns];
    }
}

- (void) onNextPgBtnPressed:(id)sender
{
    CCLOG(@"onNextPgBtnPressed");
    [self go2EndScene];
}

- (void) onEndingBtnPressed:(id)sender
{
    if (backgroundMusic != nil)
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    if (storySound != nil)
        [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    
    CCNode *sc = [CCBReader nodeGraphFromFile:@"gameMenu_s1.ccbi"];
    CCScene *scene = [CCScene node];
    [scene addChild: sc];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) go2EndScene
{
    CCLOG(@"go2EndScene");
    [self hideFlipBtns];
    CCBAnimationManager* animationManager = self.userObject;
    [animationManager runAnimationsForSequenceNamed:@"end"];
}

@end
