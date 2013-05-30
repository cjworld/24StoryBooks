//
//  LouLaiZuePageLayer.h
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "cocos2d.h"
#import "SimpleAudioEngine.h"
#import "LayerWithPauseMenu.h"

@interface LouLaiZuePageLayer : LayerWithPauseMenu{
    SimpleAudioEngine *soundEffect;
    
    CCNode *prePageBtn;
    CCNode *nextPageBtn;
    Boolean isPrePageBtnDisplayed;
    Boolean isNextPageBtnDisplayed;
    
    NSString *previousPageCCBI;
    NSString *nextPageCCBI;
    NSString *backgroundMusic;

    
}

@property (nonatomic, retain) NSString *previousPageCCBI;
@property (nonatomic, retain) NSString *nextPageCCBI;
@property (nonatomic, retain) NSString *backgroundMusic;


- (void) showFlipBtns:(Boolean) _enablePreBtn enableNextBtn:(Boolean)_enableNextBtn;
- (void) onNextPgBtnPressed:(id)sender;
- (void) onPrePgBtnPressed:(id)sender;
- (void) go2NextPage;
- (void) go2PrePage;

- (void)onExitTransitionDidStart;

@end
