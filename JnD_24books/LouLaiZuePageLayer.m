//
//  LouLaiZuePageLayer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "LouLaiZuePageLayer.h"
#import "CCBReader.h"
#define MAX_PAGE 7

@implementation LouLaiZuePageLayer

@synthesize previousPageCCBI;
@synthesize nextPageCCBI;
@synthesize backgroundMusic;


-(id) init  {
    if ((self = [super init])) {
        
        prePageBtn = [CCBReader nodeGraphFromFile:@"prePageBtn.ccbi" owner:self];
        prePageBtn.position = ccp(150, 100);
        prePageBtn.visible = NO;
        [self addChild:prePageBtn z:1];
        
        nextPageBtn = [CCBReader nodeGraphFromFile:@"nextPageBtn.ccbi" owner:self];
        nextPageBtn.position = ccp(874, 100);
        nextPageBtn.visible = NO;
        [self addChild:nextPageBtn z:1];
        
        isPrePageBtnDisplayed = false;
        isNextPageBtnDisplayed = false;
        
        [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:backgroundMusic];
    }
    return self;
}

- (void) showFlipBtns:(Boolean) _enablePreBtn enableNextBtn:(Boolean)_enableNextBtn
{
    if (_enablePreBtn)
    {
        prePageBtn.visible = YES;
        isPrePageBtnDisplayed = true;
    }
    else
    {
        prePageBtn.visible = NO;
        isPrePageBtnDisplayed = false;
    }
    if (_enableNextBtn)
    {
        nextPageBtn.visible = YES;
        isNextPageBtnDisplayed = true;
    }
    else
    {
        nextPageBtn.visible = NO;
        isNextPageBtnDisplayed = false;
    }
}

- (void) onNextPgBtnPressed:(id)sender {
    [self go2NextPage];
}

- (void) onPrePgBtnPressed:(id)sender {
    [self go2PrePage];
}

- (void) go2NextPage{
    
    if (nextPageCCBI != nil)
    {
        CCScene * sc = [CCBReader sceneWithNodeGraphFromFile:nextPageCCBI];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:false]];
    }
}

- (void) go2PrePage{
    
    if (previousPageCCBI != nil)
    {
        CCScene * sc = [CCBReader sceneWithNodeGraphFromFile:previousPageCCBI];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionPageTurn transitionWithDuration:1 scene:sc backwards:true]];
    }
    
}

- (void)onEnterTransitionDidFinish
{
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:backgroundMusic loop:true];
}

- (void)onExitTransitionDidStart
{
    
    if (storySound) [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}

- (void) resumeScene{
    CCLOG(@"LouLaiZuePageLayer:resumeScene");
    if (isPrePageBtnDisplayed)
        prePageBtn.visible = TRUE;
    if (isNextPageBtnDisplayed)
        nextPageBtn.visible = TRUE;
    [super resumeScene];
}

- (void) pauseScene{
    CCLOG(@"LouLaiZuePageLayer:pauseScene");
    prePageBtn.visible = FALSE;
    nextPageBtn.visible = FALSE;
    [super pauseScene];
}

@end