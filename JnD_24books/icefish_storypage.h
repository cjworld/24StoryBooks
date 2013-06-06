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
#import "icefish_storycontent.h"

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
    CCLabelTTF *subtitleLbl;
    
    NSMutableArray *storyContentArray;
    
    
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
