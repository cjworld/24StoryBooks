//
//  icefish_p1.m
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "icefish_p1.h"
#import "CCBAnimationManager.h"

@implementation icefish_p1

- (void) didLoadFromCCB
{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"pray.mp3"];
    
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{


    
    
    
}

- (void) onMuteBtnPressed:(id)sender{
    [[SimpleAudioEngine sharedEngine] mute];
    CCLOG(@"muteeee1111");
    
    
}

- (void) init{
    

}

@end
