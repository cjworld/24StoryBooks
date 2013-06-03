//
//  MainMenuScene.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "MainMenuScene.h"
#import "CCBReader.h"
#import "SimpleAudioEngine.h"
#import "icefish_storypage.h"

@implementation MainMenuScene

+(CCScene *) scene
{
    CCScene *scene = [CCScene node];
    MainMenuScene *layer = [MainMenuScene node];
    [scene addChild: layer];

    return scene;
}

- (id)init {
    
    if ((self = [super initWithColor:ccc4(255,255,255,255)])) {
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
        
        CCLayer * openMenu = [CCBReader nodeGraphFromFile:@"openScene.ccbi" owner:self];
        [self addChild:openMenu];
        
//        [self changeHeight:winSize.width];
//        [self changeWidth:winSize.height];
//        
//        mm_title = [CCSprite spriteWithFile:@"mm_title.png"];
//        mm_title.position = ccp(72.6, 503.9);
//        mm_title.anchorPoint = ccp(0, 0.2);
//        mm_title.scale = 0.0;
//        [self addChild:mm_title];
//        
//        mm_bookIcon = [CCSprite spriteWithFile:@"mm_book.png"];
//        mm_bookIcon.position = ccp(-180.0, 238.5);
//        [self addChild:mm_bookIcon];
//        
//        mm_menuPanel = [CCSprite spriteWithFile:@"mm_menubg.png"];
//        mm_menuPanel.position = ccp(1340.0, 207.4);
//        [self addChild:mm_menuPanel];
//        
//        
//        mm_gameMenuItem = [[CCMenuItemImage
//                           itemFromNormalImage:@"mm_start_item.png"
//                           selectedImage:@"mm_start_item_pressed.png"
//                           target:self
//                           selector:@selector(go2GameMenuScene:data:)] retain];
//        mm_gameMenuItem.position = ccp(0, 70);
//        
//        mm_bookLibraryItem = [[CCMenuItemImage
//                               itemFromNormalImage:@"mm_bl_item.png"
//                               selectedImage:@"mm_bl_item_pressed.png"
//                               target:self
//                               selector:@selector(go2BookLibraryScene:data:)] retain];
//        mm_bookLibraryItem.position = ccp(0, -70);
//        
//        CCMenu *_mainMenu = [CCMenu menuWithItems:mm_gameMenuItem, mm_bookLibraryItem, nil];
//        _mainMenu.position = ccp(306.9, 203.2);
//        [mm_menuPanel addChild:_mainMenu];
//        
    }
    return self;
}

-(void) enterPressed:(id)sender{
    [self replaceWithGameMenuScene];
    [[SimpleAudioEngine sharedEngine] playEffect:@"click.mp3"];
}

- (void) replaceWithGameMenuScene{
    
    CCNode *sc = (CCNode *)[CCBReader nodeGraphFromFile:@"gameMenu_s1.ccbi"];
    sc.tag = 1;
    CCScene *scene = [CCScene node];
    [scene addChild: sc];
    
    //CCScene *scene = [CCBReader sceneWithNodeGraphFromFile:@"Lou6.ccbi"];
    [[CCDirector sharedDirector] replaceScene:scene];
}

-(void) onEnterTransitionDidFinish
{

    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"clean.mp3" loop:true];

}

- (void)onExitTransitionDidStart
{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}

@end
