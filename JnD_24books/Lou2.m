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
    
    previousPageCCBI = @"Lou1.ccbi";
    nextPageCCBI = @"Lou3.ccbi";
    backgroundMusic = @"clean.mp3";
    
    father.bodyBtn.isEnabled = NO;
    father.stickBtn.isEnabled = NO;
    father.leftarmBtn.isEnabled = NO;
    father.headBtn.isEnabled = NO;
    
    [self setFlipBtns:YES enableNextBtn:YES];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP2.mp3"];
    if (!isPause)
    {
        father.bodyBtn.isEnabled = YES;
        father.stickBtn.isEnabled = YES;
        father.leftarmBtn.isEnabled = YES;
        father.headBtn.isEnabled = YES;
    }
    
    [self showFlipBtns];
}

- (void) resumeScene{
    [super resumeScene];
    [father enable];
}

- (void) pauseScene{
    [father disable];
    [super pauseScene];
}

@end
