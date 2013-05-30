//
//  SceneWithPauseMenu.h
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "cocos2d.h"
#import "SimpleAudioEngine.h"

@interface LayerWithPauseMenu : CCLayer {
    CCMenuItem *pm_resumeCurSceneItem;
    CCMenuItem *pm_back2MainMenuSceneItem;
    CCMenuItem *pm_shPausePanelItem;
    CCSprite *pm_menuPanel;
    CCLayer *pm_pauseLayer;
    ALuint   *storySound;
}

@property (nonatomic, readwrite) ALuint *storySound;

- (void) btnPressed:(id)sender;
- (void) hidePauseMenu:(CCAction *)callback;
- (void) showPauseMenu:(CCAction *)callback;
- (void) resumeScene;
- (void) pauseScene;
- (void) back2MainMenuScene;
- (void) replaceWithMainMenuScene;

@end
