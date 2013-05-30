//
//  p1_warrior.h
//  JnD_24books
//
//  Created by Jerry on 13/5/16.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBAnimationManager.h"
#import "SimpleAudioEngine.h"

@interface p1_warrior : CCNode {
    SimpleAudioEngine *warriorSound;
    CCMenuItemImage *warriorBtn;
    CCSprite *weapon;
    CCBAnimationManager *animationManager;
}

@property (nonatomic, retain) CCMenuItemImage *warriorBtn;

- (void) onBtnPressed:(id) sender;
- (void) enable;
- (void) disable;

@end
