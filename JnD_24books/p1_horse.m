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
    
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"horse.mp3"];
    [animationManager runAnimationsForSequenceNamed:@"scream"];
}

@end
