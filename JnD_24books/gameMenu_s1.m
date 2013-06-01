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

@synthesize storySound;

- (void) didLoadFromCCB {
    animationManager = self.userObject;
    //animationManager.delegate = self;
    self.tag = 0;
    [self showStar:star4s1 keyWord:LouStarKey];
    [self showStar:star4s2 keyWord:FishStarKey];
    [self showStar:star4s3 keyWord:TreeStarKey];
}

-(void) onEnterTransitionDidFinish
{
    [super onEnterTransitionDidFinish];
    CCLOG(@"onEnterTransitionDidFinish%d", self.tag);
//    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"clean.mp3" loop:true];
    if (self.tag == 1)
    {
        [animationManager runAnimationsForSequenceNamed:@"s1"];
    }
}

- (void)onExitTransitionDidStart
{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}

-(void) onIntroEndPressed:(id)sender
{
    CCLOG(@"why");
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"guide.mp3"];
    [animationManager runAnimationsForSequenceNamed:@"s2"];
}

-(void) pressedStory:(id)sender
{
    if (self.storySound) [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    
    CCMenuItemImage *button = (CCMenuItemImage*) sender;
    switch (button.tag) {
        case lou_story:
            self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"guide.mp3"];
            [animationManager runAnimationsForSequenceNamed:@"fadeInLou"];
            targetStoryIndex = lou_story;
            break;
        case fish_story:
            self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"guide.mp3"];
            [animationManager runAnimationsForSequenceNamed:@"fadeInIcefish"];
            targetStoryIndex = fish_story;
            break;
        default:
            break;
    }
    NSLog(@"pressedStory %d", button.tag);
    [[SimpleAudioEngine sharedEngine] playEffect:@"click.mp3"];
}

- (void) onReadBtnPressed:(id)sender {
    if (self.storySound) [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    
    switch (targetStoryIndex) {
        case lou_story:
            [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"Lou1.ccbi"]];
            break;
        case fish_story:
            [[CCDirector sharedDirector] replaceScene:[CCBReader sceneWithNodeGraphFromFile:@"icefish_storypage.ccbi"]];
            break;
        default:
            break;
    }
    
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"click.mp3"];
}

-(void) showStar:(CCSprite*)sprite keyWord:(NSString*)keyString{
    NSUserDefaults *userPrefs = [NSUserDefaults standardUserDefaults];
    int starNumber = [userPrefs integerForKey:keyString];

    if (!starNumber)
    {
        starNumber = 0;
    }
    
    //CCTexture2D* tex = nil;
    //CCSpriteFrame *frame = nil;
    CCLOG(@"%d", starNumber);
    switch (starNumber) {
        case 0:
            [sprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"star0.png"]];
            //frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"star0.png"];
            break;
        case 1:
            [sprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"star1.png"]];
            //frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"star1.png"];
            break;
        case 2:
            [sprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"star2.png"]];
            //frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"star2.png"];
            break;
        case 3:
            [sprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"star3.png"]];
            //frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"star3.png"];
            break;
        default:
            [sprite setTexture:[[CCTextureCache sharedTextureCache] addImage:@"star0.png"]];
            //frame = [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:@"star0.png"];
            break;
    }
    //[sprite setTexture:tex];
    //[sprite setDisplayFrame:frame];
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    CCLOG(@"AnimationComplate");
    if ([name isEqual: @"s2"]) {
        CCLOG(@"s2 end");
    }
    else if ([name isEqual: @"fadeInLou"] || [name isEqual: @"fadeInIcefish"])
    {
        [[SimpleAudioEngine sharedEngine] playEffect:@"guide1.mp3"];
    }
}


@end
