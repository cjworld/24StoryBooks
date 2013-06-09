//
//  icefish_p5.h
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "icefish_storycontent.h"

@interface icefish_p5 : icefish_storycontent {
    CCSprite *fatherSprite;
    CCBAnimationManager *fatherAnimationManager;
    CCSprite *motherSprite;
    CCBAnimationManager *motherAnimationManager;
}

@property (nonatomic, assign) CCNode *fatherSprite;
@property (nonatomic, assign) CCNode *motherSprite;

@end
