//
//  icefish_storycontent.h
//  JnD_24books
//
//  Created by Jerry on 13/6/3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CCBAnimationManager.h"

@interface storyEvent : NSObject{
    SEL eventHandler;
    NSString *subtitle;
    NSString *music;
}

@property (nonatomic,assign) SEL eventHandler;
@property (nonatomic,assign) NSString *subtitle;
@property (nonatomic,assign) NSString *music;

- (id)init:(SEL)_eventHandler subtitle:(NSString *)_subtitle music:(NSString *)_music;

@end

@protocol icefishStoryContentDelegate <NSObject>

- (void) flashNextPageBtn;

@end

@interface icefish_storycontent : CCSprite {
    int curEventIndex;
    CCLabelTTF *subtitleLbl;
    NSMutableArray *storyEventArray;
    NSMutableArray *storySoundArray;
    CCBAnimationManager *animationManager;
    id<icefishStoryContentDelegate> icefishStoryContentDelegate;
}

@property (nonatomic, assign) int curEventIndex;
@property (nonatomic, assign) CCLabelTTF *subtitleLbl;
@property (nonatomic, weak) id<icefishStoryContentDelegate>  icefishStoryContentDelegate;

- (void) setSubtitle:(NSString *)subtitle;
- (void) executeNextEvent;
- (void) onTouched:(CGPoint)relative_touchLocation;

@end
