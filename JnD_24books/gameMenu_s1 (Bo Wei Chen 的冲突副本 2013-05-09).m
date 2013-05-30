//
//  gameMenu_s1.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/20.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "gameMenu_s1.h"

#define lou_story   1
#define fish_story  2
#define tree_story  3

#define LouStarKey  @"louStar"
#define FishStarKey @"fishStar"
#define TreeStarKey @"treeStar"

@implementation gameMenu_s1

- (void) didLoadFromCCB {
    animationManager = self.userObject;
    //animationManager.delegate = self;
    self.tag = 0;
}

-(void) onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    CCLOG(@"onEnterTransitionDidFinish%d", self.tag);
    if (self.tag == 1)
    {
        [animationManager runAnimationsForSequenceNamed:@"s1"];
    }
}

-(void) onIntroEndPressed:(id)sender
{
    CCLOG(@"why");
    [animationManager runAnimationsForSequenceNamed:@"s2"];
}

-(void) pressedStory:(id)sender
{
    CCMenuItemImage *button = (CCMenuItemImage*) sender;
    switch (button.tag) {
        case lou_story:
            [animationManager runAnimationsForSequenceNamed:@"lou_story_in"];
            break;
        case fish_story:
            
            break;
        case tree_story:
            
            break;
        default:
            break;
    }
    NSLog(@"pressedStory %d", button.tag);
}

- (void) story1Pressed:(id)sender {
    [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"Lou6.ccbi"]];
}



-(void) showStar:(CCSprite*)sprite keyWord:(NSString*)keyString{
    NSUserDefaults *userPrefs = [NSUserDefaults standardUserDefaults];
    int starNumber = [userPrefs integerForKey:keyString];

    if (!starNumber)
    {
        starNumber = 0;
    }
    
    
    switch (starNumber) {
        case 0:
            [sprite setDisplayFrame:@"star0.png"];
            break;
        case 1:
            [sprite setDisplayFrame:@"star1.png"];
            break;
        case 2:
            [sprite setDisplayFrame:@"star2.png"];
            break;
        case 3:
            [sprite setDisplayFrame:@"star3.png"];
            break;
            
        default:
            [sprite setDisplayFrame:@"star0.png"];
            break;
    }
    
}

@end
