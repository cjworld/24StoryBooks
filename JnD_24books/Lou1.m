//
//  Lou1.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou1.h"
#import "CCBAnimationManager.h"


@implementation Lou1

- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
    
    previousPageCCBI = nil;
    nextPageCCBI = @"Lou2.ccbi";
    backgroundMusic = @"pray.mp3";
    horse.horseBtn.isEnabled = NO;
    warrior.warriorBtn.isEnabled = NO;
    
    [self setFlipBtns:NO enableNextBtn:YES];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP1.mp3"];
    [self showFlipBtns];
    if (!isPause)
    {
        horse.horseBtn.isEnabled = YES;
        warrior.warriorBtn.isEnabled = YES;
    }
}

- (void) resumeScene{
    CCLOG(@">>>>> Lou1: resumeScene");
    [super resumeScene];
    [horse enable];
    [warrior enable];
}

- (void) pauseScene{
    CCLOG(@">>>>> Lou1: pauseScene");
    [horse disable];
    [warrior disable];
    [super pauseScene];
}

@end
