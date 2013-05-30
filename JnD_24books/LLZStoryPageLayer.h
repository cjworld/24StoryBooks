//
//  LouLaiZuePageLayer.h
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "cocos2d.h"
#import "CCBReader.h"
#import "SimpleAudioEngine.h"
#import "flipPageLayer.h"
#import "pauseLayer.h"

@interface LLZStoryPageLayer : CCLayer {
    pauseLayer *pmLayer;
    flipPageLayer *fpLayer;
    Boolean isPause;
    
    NSString *previousPageCCBI;
    NSString *nextPageCCBI;
    NSString *backgroundMusic;
    ALuint   *storySound;
}

@property (nonatomic, retain) NSString *previousPageCCBI;
@property (nonatomic, retain) NSString *nextPageCCBI;
@property (nonatomic, retain) NSString *backgroundMusic;
@property (nonatomic, readwrite) ALuint *storySound;

- (void) setFlipBtns:(BOOL) _enablePreBtn enableNextBtn:(BOOL)_enableNextBtn;
- (void) showFlipBtns;
- (void) hideFlipBtns;
- (void) onNextPgBtnPressed:(id)sender;
- (void) onPrePgBtnPressed:(id)sender;
- (void) go2NextPage;
- (void) go2PrePage;
- (void) resumeScene;
- (void) pauseScene;
- (void) onbPMBtnPressed:(id)sender;
- (void) back2MainMenuScene;

@end
