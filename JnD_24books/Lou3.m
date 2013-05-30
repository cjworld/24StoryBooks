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
    
    previousPageCCBI = @"Lou2.ccbi";
    nextPageCCBI = @"Lou4.ccbi";
    backgroundMusic = @"pray.mp3";
    
    [self setFlipBtns:YES enableNextBtn:YES];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP3.mp3"];
    [self showFlipBtns];
}

@end
