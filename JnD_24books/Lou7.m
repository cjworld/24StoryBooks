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
    
    self.previousPageCCBI = @"Lou6.ccbi";
    self.nextPageCCBI = nil;
    self.backgroundMusic = @"pray.mp3";
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"AnimationComplate");
    if ([name isEqual: @"end"]) {
        CCLOG(@"end");
    }else{
        CCLOG(@"other");
        self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP7.mp3"];
        [self showFlipBtns:TRUE enableNextBtn:TRUE];
    }
}

- (void) onNextPgBtnPressed:(id)sender
{
    [[SimpleAudioEngine sharedEngine] stopEffect:self.storySound];
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP7end.mp3"];
    CCLOG(@"onNextPgBtnPressed");
    [self go2EndScene];
}

- (void) onEndingBtnPressed:(id)sender
{
    [[SimpleAudioEngine sharedEngine] stopEffect:self.storySound];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    
    CCNode *sc = [CCBReader nodeGraphFromFile:@"gameMenu_s1.ccbi"];
    CCScene *scene = [CCScene node];
    [scene addChild: sc];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

- (void) go2EndScene
{
    CCLOG(@"go2EndScene");
    [self showFlipBtns:FALSE enableNextBtn:FALSE];
    CCBAnimationManager* animationManager = self.userObject;
    [animationManager runAnimationsForSequenceNamed:@"end"];
}

@end
