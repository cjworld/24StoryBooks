//
//  gameMenu_s1.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBReader.h"
#import "CCBAnimationManager.h"
#import "SimpleAudioEngine.h"

@interface gameMenu_s1 : CCLayer {
    CCBAnimationManager *animationManager;
    CCSprite *star4s1;
    CCSprite *star4s2;
    CCSprite *star4s3;
    
    ALuint   *storySound;
    
}

@property (nonatomic, readwrite) ALuint *storySound;

-(void) pressedStory:(id)sender;
-(void) story1Pressed:(id)sender;
-(void) onIntroEndPressed:(id)sender;
-(void) showStar:(CCSprite*)sprite keyWord:(NSString*)keyString;

@end
