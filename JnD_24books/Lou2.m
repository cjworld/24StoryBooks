//
//  Lou2.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou2.h"
#import "CCBAnimationManager.h"

@implementation Lou2

- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
    
    self.previousPageCCBI = @"Lou1.ccbi";
    self.nextPageCCBI = @"Lou3.ccbi";
    self.backgroundMusic = @"clean.mp3";
    
    father.bodyBtn.isEnabled = NO;
    father.stickBtn.isEnabled = NO;
    father.leftarmBtn.isEnabled = NO;
    father.headBtn.isEnabled = NO;
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP2.mp3"];
    [self showFlipBtns:TRUE enableNextBtn:TRUE];
    
    father.bodyBtn.isEnabled = YES;
    father.stickBtn.isEnabled = YES;
    father.leftarmBtn.isEnabled = YES;
    father.headBtn.isEnabled = YES;
}

- (void)onExitTransitionDidStart{
    
    [[SimpleAudioEngine sharedEngine] stopEffect:father.storySound];
    [super onExitTransitionDidStart];
}

@end
