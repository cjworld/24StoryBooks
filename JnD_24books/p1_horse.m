//
//  p1_horse.m
//  JnD_24books
//
//  Created by Jerry on 13/5/16.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "p1_horse.h"

@implementation p1_horse

@synthesize horseBtn;

- (void) didLoadFromCCB
{
    animationManager = self.userObject;
    horseSound = nil;
}

-(void) onBtnPressed:(id) sender
{
    [animationManager runAnimationsForSequenceNamed:@"scream"];
    if (horseSound) [[SimpleAudioEngine sharedEngine] stopEffect:horseSound];
    horseSound = [[SimpleAudioEngine sharedEngine] playEffect:@"horse.mp3"];
}

-(void) onExit
{
    if (horseSound) [[SimpleAudioEngine sharedEngine] stopEffect:horseSound];
}

- (void) disable
{
    horseBtn.isEnabled = NO;
}

- (void) enable
{
    horseBtn.isEnabled = YES;
}

@end
