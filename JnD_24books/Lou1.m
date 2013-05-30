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
    
    self.previousPageCCBI = nil;
    self.nextPageCCBI = @"Lou2.ccbi";
    self.backgroundMusic = @"pray.mp3";
    horse.horseBtn.isEnabled = NO;
    warrior.warriorBtn.isEnabled = NO;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP1.mp3"];
    [self showFlipBtns:FALSE enableNextBtn:TRUE];
    
    horse.horseBtn.isEnabled = YES;
    warrior.warriorBtn.isEnabled = YES;
}

- (void)onExitTransitionDidStart{
    [[SimpleAudioEngine sharedEngine] stopEffect:horse.storySound];
    [super onExitTransitionDidStart];
}

@end
