//
//  SceneWithPauseMenu.m
//  JnD_24books
//
//  Created by Jerry on 13/3/24.
//
//

#import "pauseLayer.h"

@implementation pauseLayer

- (void) didLoadFromCCB
{
    self.position = ccp(0, 768);
}

- (void) showPauseMenu{
    CCLOG(@"LayerWithPauseMenu: pauseScene");
    self.position = ccp(0, 0);
}

- (void) hidePauseMenu{
    CCLOG(@"LayerWithPauseMenu: resumeScene");
    self.position = ccp(0, 768);
}

@end


