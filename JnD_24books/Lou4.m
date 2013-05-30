//
//  Lou4.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou4.h"
#import "CCBAnimationManager.h"

@implementation Lou4

- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
    
    previousPageCCBI = @"Lou3.ccbi";
    nextPageCCBI = @"Lou5.ccbi";
    backgroundMusic = @"clean.mp3";
    
    [self setFlipBtns:YES enableNextBtn:YES];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP4.mp3"];
    [self showFlipBtns];
}

@end
