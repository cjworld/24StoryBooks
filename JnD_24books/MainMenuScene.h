//
//  MainMenuScene.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/3/12.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface MainMenuScene : CCLayerColor {
    CCMenuItem *mm_gameMenuItem;
    CCMenuItem *mm_bookLibraryItem;
    CCSprite *mm_menuPanel;
    CCSprite *mm_bookIcon;
    CCSprite *mm_title;
}

+ (CCScene *) scene;
-(void) enterPressed:(id)sender;
- (void) replaceWithGameMenuScene;

@end
