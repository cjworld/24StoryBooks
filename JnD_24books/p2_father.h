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

#define qqq 9

@interface p2_father : CCNode {
    
    SimpleAudioEngine *fatherSound;
    
    CCMenuItemImage *bodyBtn;
    CCMenuItemImage *stickBtn;
    CCMenuItemImage *headBtn;
    CCMenuItemImage *leftarmBtn;
    
    CCBAnimationManager *animationManager;
}

@property (nonatomic, retain) CCMenuItemImage *bodyBtn;
@property (nonatomic, retain) CCMenuItemImage *stickBtn;
@property (nonatomic, retain) CCMenuItemImage *headBtn;
@property (nonatomic, retain) CCMenuItemImage *leftarmBtn;

- (void) onBtnPressed:(id) sender;
- (void) enable;
- (void) disable;

@end
