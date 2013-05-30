//
//  SceneWithPauseMenu.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "LayerWithPauseMenu.h"
#import "pauseLayer.h"
#import "CCBReader.h"

#define RESUMEBTN 1
#define BACK2MENU 2
#define PAUSEBTN 3

@implementation LayerWithPauseMenu
@synthesize storySound;

- (id)init {
    
    if ((self = [super init])) {
        
        pm_pauseLayer = [CCBReader nodeGraphFromFile:@"pauseLayer.ccbi" owner:self];
        pm_pauseLayer.position = ccp(0, 768);
        [self addChild:pm_pauseLayer z:2];
        
        /* 511.9, 318.9);
        [pm_pauseLayer addChild:pm_menuPanel];
        
        CCSprite *pm_title = [CCSprite spriteWithFile:@"pausetitle.png"];
        pm_title.position = ccp(477.8, 701.7);
        [pm_menuPanel addChild:pm_title];
        
        pm_back2MainMenuSceneItem = [[CCMenuItemImage
                                      itemFromNormalImage:@"pause_backmm_item.png"
                                      selectedImage:@"pause_backmm_item_pressed.png"
                                      target:self
                                      selector:@selector(back2MainMenuScene:data:)] retain];
        pm_back2MainMenuSceneItem.position = ccp(0.0, -100.0);
        pm_resumeCurSceneItem = [[CCMenuItemImage
                                  itemFromNormalImage:@"pause_resume_item.png"
                                  selectedImage:@"pause_resume_item_pressed.png"
                                  target:self
                                  selector:@selector(resumeCurScene:data:)] retain];
        pm_resumeCurSceneItem.position = ccp(0.0, 10.0);
        CCMenu *pm_pauseItemsMenu = [CCMenu menuWithItems:pm_back2MainMenuSceneItem, pm_resumeCurSceneItem, nil];
        pm_pauseItemsMenu.position = ccp(475.3, 447.9);
        [pm_menuPanel addChild:pm_pauseItemsMenu];
        
        pm_shPausePanelItem = [[CCMenuItemImage
                                itemFromNormalImage:@"pause_rope.png"
                                selectedImage:@"pause_rope_pressed.png"
                                target:self
                                selector:@selector(resume_pauseCurScene:data:)] retain];
        pm_shPausePanelItem.position = ccp(32.3, -97.0);
        pm_shPausePanelItem.rotation = -20;
        CCMenu *_hsPausePanelMenu = [CCMenu menuWithItems:pm_shPausePanelItem, nil];
        _hsPausePanelMenu.position = ccp(843.5, 256.3);
        [pm_menuPanel addChild:_hsPausePanelMenu];
        */
    }
    return self;
}

-(void) btnPressed:(id)sender{
    CCLOG(@"%d", [sender tag]);
    if ([sender tag] == BACK2MENU)
    {
        [[SimpleAudioEngine sharedEngine] stopEffect:self.storySound];
        [self back2MainMenuScene];
    }
    else if ([sender tag] == RESUMEBTN)
        [self resumeScene];
    else if ([sender tag] == PAUSEBTN)
        [self pauseScene];
}

- (void) pauseScene{
    CCLOG(@"LayerWithPauseMenu:pauseScene");
    
    CCAction *move2 = [[CCCallBlock actionWithBlock:^{
        CCLOG(@"(%f, %f)", pm_pauseLayer.position.x, pm_pauseLayer.position.y);
    }] retain];
    
    [self showPauseMenu:move2];
}

- (void) showPauseMenu:(CCAction *)callback{
    CCLOG(@"showPauseMenu");
    
    pm_pauseLayer.position = ccp(0, 0);
    //CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:pm_pauseLayer action:[CCMoveTo actionWithDuration:0.5 position:ccp(0, 0)]] retain];
    
    //CCSequence *s1 = [CCSequence actions:t1, callback, nil];
    CCSequence *s1 = [CCSequence actions:callback, nil];
    [self runAction:s1];
    
}

- (void) resumeScene{
    CCLOG(@"LayerWithPauseMenu:resumeScene");
    
    CCAction *move2 = [CCCallBlock actionWithBlock:^{
        CCLOG(@"(%f, %f)", pm_pauseLayer.position.x, pm_pauseLayer.position.y);
    }];
    
    [self hidePauseMenu:move2];
}

- (void) hidePauseMenu:(CCAction *)callback{
    CCLOG(@"hidePauseMenu");
    
    pm_pauseLayer.position = ccp(0, 768);
    //CCTargetedAction *t1 =[[CCTargetedAction actionWithTarget:pm_pauseLayer action:[CCMoveTo actionWithDuration:0.5 position:ccp(0, 768)]] retain];
    
    //CCSequence *s1 = [CCSequence actions:t1, callback, nil];
    CCSequence *s1 = [CCSequence actions:callback, nil];
    [self runAction:s1];
}

- (void) back2MainMenuScene{
    
    CCAction *hidePhase2 = [CCCallBlock actionWithBlock:^{
        [self replaceWithMainMenuScene];
    }];
    
    [self hidePauseMenu:hidePhase2];
}

- (void) replaceWithMainMenuScene{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
    
    CCNode *sc = [CCBReader nodeGraphFromFile:@"gameMenu_s1.ccbi"];
    CCScene *scene = [CCScene node];
    [scene addChild: sc];
    
    [[CCDirector sharedDirector] replaceScene:scene];
}

@end


