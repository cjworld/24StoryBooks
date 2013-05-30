//
//  Lou5.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou5.h"
#import "CCBAnimationManager.h"

@implementation Lou5

- (void) didLoadFromCCB
{
    CCBAnimationManager *animationManager = self.userObject;
    animationManager.delegate = self;
    
    self.previousPageCCBI = @"Lou4.ccbi";
    self.nextPageCCBI = @"Lou6.ccbi";
    self.backgroundMusic = @"pray.mp3";
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP5.mp3"];
    [self showFlipBtns:TRUE enableNextBtn:TRUE];
}

@end
