//
//  p2_father.m
//  JnD_24books
//
//  Created by Jerry on 13/5/17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "p2_father.h"


@implementation p2_father

@synthesize bodyBtn;
@synthesize stickBtn;
@synthesize headBtn;
@synthesize leftarmBtn;

- (void) didLoadFromCCB
{
    animationManager = self.userObject;
    fatherSound = nil;
}

-(void) onBtnPressed:(id) sender
{
    [animationManager runAnimationsForSequenceNamed:@"scream"];
    if (fatherSound)
        [[SimpleAudioEngine sharedEngine] stopEffect:fatherSound];
    fatherSound = [[SimpleAudioEngine sharedEngine] playEffect:@"cucusaw.mp3"];
}

-(void) onExit
{
    if (fatherSound) [[SimpleAudioEngine sharedEngine] stopEffect:fatherSound];
}

- (void) disable
{
    bodyBtn.isEnabled = NO;
    stickBtn.isEnabled = NO;
    headBtn.isEnabled = NO;
    leftarmBtn.isEnabled = NO;
}

- (void) enable
{
    bodyBtn.isEnabled = YES;
    stickBtn.isEnabled = YES;
    headBtn.isEnabled = YES;
    leftarmBtn.isEnabled = YES;
}

@end
