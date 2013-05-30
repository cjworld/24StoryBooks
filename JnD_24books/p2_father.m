//
//  p2_father.m
//  JnD_24books
//
//  Created by Jerry on 13/5/17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "p2_father.h"
#import "SimpleAudioEngine.h"

@implementation p2_father

@synthesize bodyBtn;
@synthesize stickBtn;
@synthesize headBtn;
@synthesize leftarmBtn;
@synthesize storySound;

- (void) didLoadFromCCB
{
    animationManager = self.userObject;
}

-(void) onBtnPressed:(id) sender
{
    if (self.storySound) {
        [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    }
    
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"coolcoolsaw.mp3"];
    [animationManager runAnimationsForSequenceNamed:@"scream"];
}

@end
