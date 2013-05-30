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
    
    self.previousPageCCBI = @"Lou3.ccbi";
    self.nextPageCCBI = @"Lou5.ccbi";
    self.backgroundMusic = @"clean.mp3";
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP4.mp3"];
    [self showFlipBtns:TRUE enableNextBtn:TRUE];
}

@end
