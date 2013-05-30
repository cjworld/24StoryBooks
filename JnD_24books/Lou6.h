//
//  Lou6.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBReader.h"
#import "CCBAnimationManager.h"
#import "LouLaiZuePageLayer.h"

typedef enum {
    kBookReading,
    kGameIntro,
    kGameCountDown,
    kGamePlay,
    kGamePause,
    kGameWin,
    kGameOver
} GameStatus;

typedef enum {
    kSwipeUp,
    kSwipeDown,
    kSwipeLeft,
    kSwipeRight,
} GestureType;

@interface beatNGesture : NSObject{
    float songTime;
    GestureType gestureType;
    CCNode *gestureNode;
}

@property (nonatomic,assign) float songTime;
@property (nonatomic,assign) GestureType gestureType;

- (id)init:(float)_songTime gestureType:(GestureType)_gestureType;
- (CCNode *) getGestureNode;

@end

@interface Lou6 : LouLaiZuePageLayer {
    
    CGSize _winSize;
    
    CCNode *_scrBarStar1;
    CCNode *_scrBarStar2;
    CCNode *_scrBarStar3;
    CCNode *_scrBar;
    CCSprite *_hitHint;
    CCMenuItemImage *_leftBtn;
    CCMenuItemImage *_rightBtn;
    CCMenuItemImage *_upBtn;
    CCMenuItemImage *_downBtn;
    CCMenuItemImage *_passBtn;
    CCMenuItemImage *_failBtn;
    CCMenuItemImage *_introEndBtn;
    CCSprite *_dancePanel;
    CCLabelTTF *countDownLbl;
    Boolean isCountDownOver;
    
    NSMutableArray *_beatsArray;
    NSMutableArray *_checkPointArray;
    float _previousCurTime;
    float _gameTime;
    GameStatus _gameState;
    int _gameScore;
    CCBAnimationManager *animationManager;
    CDLongAudioSource *danceBGMAudioSource;
}

- (void) onStartGameBtnPressed: (id) sender;
- (void) onFinishBtnPressed: (id) sender;

@end
