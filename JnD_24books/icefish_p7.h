//
//  icefish_p7.h
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "icefish_storycontent.h"

@interface icefish_p7 : icefish_storycontent {
    CCSprite *wsSprite;
    CCBAnimationManager *wsAnimationManager;
}

@property (nonatomic, assign) CCNode *wsSprite;

@end
