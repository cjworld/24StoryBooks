//
//  Lou3.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou3.h"
#import "CCBAnimationManager.h"

@implementation Lou3

- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
    
    birdsound = [[SimpleAudioEngine sharedEngine] playEffect:@"bird.mp3"];
    
    self.previousPageCCBI = @"Lou2.ccbi";
    self.nextPageCCBI = @"Lou4.ccbi";
    self.backgroundMusic = @"pray.mp3";
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP3.mp3"];
    [self showFlipBtns:TRUE enableNextBtn:TRUE];
}

- (void)onExitTransitionDidStart{
    [[SimpleAudioEngine sharedEngine] stopEffect:birdsound];
    [super onExitTransitionDidStart];
}

@end
