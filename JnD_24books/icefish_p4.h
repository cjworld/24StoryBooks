//
//  icefish_p4.h
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "icefish_storycontent.h"

@interface icefish_p4 : icefish_storycontent {
    CCSprite *wsSprite;
    CCSprite *tree1Sprite;
    CCSprite *tree2Sprite;
    CCSprite *tree3Sprite;
    CCBAnimationManager *wsAnimationManager;
    CCBAnimationManager *tree1AnimationManager;
    CCBAnimationManager *tree2AnimationManager;
    CCBAnimationManager *tree3AnimationManager;
}

@property (nonatomic, assign) CCNode *wsSprite;
@property (nonatomic, assign) CCNode *tree1Sprite;
@property (nonatomic, assign) CCNode *tree2Sprite;
@property (nonatomic, assign) CCNode *tree3Sprite;

@end
