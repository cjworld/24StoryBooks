//
//  p2_father.h
//  JnD_24books
//
//  Created by Jerry on 13/5/17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBAnimationManager.h"
#import "SimpleAudioEngine.h"

@interface p2_father : CCNode {
    
    CCMenuItemImage *bodyBtn;
    CCMenuItemImage *stickBtn;
    CCMenuItemImage *headBtn;
    CCMenuItemImage *leftarmBtn;
    
    CCBAnimationManager *animationManager;
    
    ALuint *storysound;
}

@property (nonatomic, retain) CCMenuItemImage *bodyBtn;
@property (nonatomic, retain) CCMenuItemImage *stickBtn;
@property (nonatomic, retain) CCMenuItemImage *headBtn;
@property (nonatomic, retain) CCMenuItemImage *leftarmBtn;
@property (nonatomic, readwrite) ALuint *storySound;

-(void) onBtnPressed:(id) sender;

@end
