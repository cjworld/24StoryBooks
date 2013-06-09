//
//  icefish_p3.h
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "icefish_storycontent.h"

@interface icefish_p3 : icefish_storycontent {
    CCSprite *wsSprite;
    CCSprite *axSprite;
    CCBAnimationManager *wsAnimationManager;
    CCBAnimationManager *axAnimationManager;
}

@property (nonatomic, assign) CCNode *wsSprite;
@property (nonatomic, assign) CCNode *axSprite;

@end
