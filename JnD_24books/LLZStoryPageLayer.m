//
//  LouLaiZuePageLayer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "LLZStoryPageLayer.h"

#define RESUMEBTN 1
#define BACK2MENU 2
#define PAUSEBTN 3

@implementation LLZStoryPageLayer

@synthesize previousPageCCBI;
@synthesize nextPageCCBI;
@synthesize backgroundMusic;
@synthesize storySound;

- (id)init {
    
    if ((self = [super init])) {
        
        fpLayer = (flipPageLayer *)[CCBReader nodeGraphFromFile:@"flipPageLayer.ccbi" owner:self];
        [self addChild:fpLayer z:2];
        
        pmLayer = (pauseLayer *)[CCBReader nodeGraphFromFile:@"pauseLayer.ccbi" owner:self];
        [self addChild:pmLayer z:3];
        
        backgroundMusic = nil;
        previousPageCCBI = nil;
        nextPageCCBI = nil;
        isPause = false;
    }
    return self;
}

- (void) setFlipBtns:(BOOL) _enablePreBtn enableNextBtn:(BOOL)_enableNextBtn
{
    [fpLayer setBtns:_enablePreBtn enableNextBtn:_enableNextBtn];
}

- (void) showFlipBtns
{
    [fpLayer showBtns];
}

- (void) hideFlipBtns
{
    [fpLayer hideBtns];
}

- (void) onNextPgBtnPressed:(id)sender {
    CCLOG(@"LLZStoryPageLayer: onNextPgBtnPressed");
    [self go2NextPage];
    [[SimpleAudioEngine sharedEngine] playEffect:@"click.mp3"];
}

- (void) onPrePgBtnPressed:(id)sender {
    CCLOG(@"LLZStoryPageLayer: onPrePgBtnPressed");
    [self go2PrePage];
    [[SimpleAudioEngine sharedEngine] playEffect:@"click.mp3"];
}

- (void) go2NextPage{
    CCLOG(@"LLZStoryPageLayer: go2NextPage");
    if (nextPageCCBI != nil)
    {
        CCScene * sc = [CCBReader sceneWithNodeGraphFromFile:nextPageCCBI];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:false]];
    }
}

- (void) go2PrePage{
    CCLOG(@"LLZStoryPageLayer: go2PrePage");
    if (previousPageCCBI != nil)
    {
        CCScene * sc = [CCBReader sceneWithNodeGraphFromFile:previousPageCCBI];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:true]];
    }
    
}

- (void)onEnterTransitionDidFinish
{
    CCLOG(@"LLZStoryPageLayer: onEnterTransitionDidFinish");
    if (backgroundMusic != nil)
    {
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:backgroundMusic];
        [[SimpleAudioEngine sharedEngine] playBackgroundMusic:backgroundMusic loop:true];
    }
}

- (void)onExitTransitionDidStart
{
    CCLOG(@"LLZStoryPageLayer: onExitTransitionDidStart");
    if (storySound)
        [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    if (backgroundMusic != nil)
        [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}

-(void) onbPMBtnPressed:(id)sender{
    
    CCLOG(@"LLZStoryPageLayer: onbPMBtnPressed:%d", [sender tag]);
    if ([sender tag] == BACK2MENU) {
        [self back2MainMenuScene];
    } else if ([sender tag] == RESUMEBTN) {
        [self resumeScene];
    } else if ([sender tag] == PAUSEBTN){
        [self pauseScene];
    }
    [[SimpleAudioEngine sharedEngine] playEffect:@"click.mp3"];
}

- (void) resumeScene{
    CCLOG(@"LLZStoryPageLayer: resumeScene");
    [fpLayer enableBtns];
    [pmLayer hidePauseMenu];
    isPause = false;
}

- (void) pauseScene{
    CCLOG(@"LLZStoryPageLayer: pauseScene");
    [fpLayer disableBtns];
    [pmLayer showPauseMenu];
    isPause = true;
}

- (void) back2MainMenuScene{
    CCLOG(@"LLZStoryPageLayer: back2MainMenuScene");
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    
    CCNode *sc = [CCBReader nodeGraphFromFile:@"gameMenu_s1.ccbi"];
    CCScene *scene = [CCScene node];
    [scene addChild: sc];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

@end