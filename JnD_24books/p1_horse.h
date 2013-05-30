//
//  p1_horse.h
//  JnD_24books
//
//  Created by Jerry on 13/5/16.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBAnimationManager.h"
#import "SimpleAudioEngine.h"

@interface p1_horse : CCNode {
    CCMenuItemImage *horseBtn;
    CCBAnimationManager *animationManager;
    
    ALuint   *storySound;
}

@property (nonatomic, retain) CCMenuItemImage *horseBtn;
@property (nonatomic, readwrite) ALuint *storySound;

-(void) onBtnPressed:(id) sender;
@end
