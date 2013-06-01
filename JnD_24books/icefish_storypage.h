//
//  icefish_storypage.h
//  JnD_24books
//
//  Created by Jerry on 13/6/1.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBReader.h"
#import "CCBAnimationManager.h"

@interface storyPage : NSObject{
    NSString *ccbi;
    CCSprite *sprite;
}

@property (nonatomic,assign) NSString *ccbi;
@property (nonatomic,assign) CCSprite *sprite;

@end

@interface storyEvent : NSObject{
    SEL eventHandler;
    NSString *subtitle;
    NSString *music;
}

@property (nonatomic,assign) NSString *subtitle;
@property (nonatomic,assign) NSString *music;

@end

@interface icefish_storypage : CCLayer {
    CCMenu *pauseMenu;
    CCMenuItemImage *homeBtn;
    CCMenuItemImage *resumeBtn;
    
    CCMenu *btnMenu;
    CCMenuItemImage *muteBtn;
    CCMenuItemImage *prePageBtn;
    CCMenuItemImage *nextPageBtn;
    CCMenuItemImage *pauseBtn;
    
    CCLayer *storyContentLayer;
    CCLabelTTF *storySubLbl;
    CCSprite *storyBgSprite;
    
    NSMutableArray *storyPageArray;
    NSMutableArray *storyEventArray;
    
    int pageIndex;
    CCBAnimationManager *animationManager;
}

- (void) onMuteBtnPressed:(id)sender;
- (void) onPrePageBtnPressed:(id)sender;
- (void) onNextPageBtnPressed:(id)sender;
- (void) onPauseBtnPressed:(id)sender;
- (void) onHomeBtnPressed:(id)sender;
- (void) onResumeBtnPressed:(id)sender;

@end
