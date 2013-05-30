//
//  SceneWithPauseMenu.h
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "cocos2d.h"
#import "CCBReader.h"
#import "SimpleAudioEngine.h"

@interface pauseLayer : CCLayer {
    CCMenuItemImage *pm_resumeBtn;
    CCMenuItemImage *pm_back2menuBtn;
    CCMenuItemImage *pm_switchBtn;
}

- (void) hidePauseMenu;
- (void) showPauseMenu;


@end
