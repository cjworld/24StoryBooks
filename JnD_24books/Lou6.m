//
//  Lou6.m
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "Lou6.h"
#import "CCBReader.h"
#import "CCBAnimationManager.h"

#define kCountDownTime 4
#define kGameTtlTime 44

@implementation beatNGesture

@synthesize songTime;
@synthesize gestureType;

- (id)init:(float)_songTime gestureType:(GestureType)_gestureType
{
    if ( self = [super init] )
    {
        songTime = _songTime;
        gestureType = _gestureType;
    }
    return self;
}

- (CCNode *) getGestureNode
{
    return gestureNode;
}

- (void) setGestureNode:(CCNode *)_gestureNode
{
    gestureNode = _gestureNode;
}

@end

@implementation Lou6


- (void) didLoadFromCCB
{
    _gameState = kBookReading;
    
    float __time = 11.6;
    float interval = 0.46875;

    _beatsArray = [[NSMutableArray alloc] init];
    [_beatsArray addObject:[[[beatNGesture alloc] init:__time gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 2) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 4) gestureType:kSwipeUp] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 6) gestureType:kSwipeDown] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 8) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 10) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 12) gestureType:kSwipeUp] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 14) gestureType:kSwipeUp] retain]];

    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 16) gestureType:kSwipeUp] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 17) gestureType:kSwipeDown] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 18) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 19) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 20) gestureType:kSwipeUp] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 21) gestureType:kSwipeDown] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 22) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 23) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 24) gestureType:kSwipeRight] retain]];
    
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 26) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 28) gestureType:kSwipeUp] retain]];
    
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 32) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 33) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 34) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 35) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 36) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 37) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 38) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 39) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 40) gestureType:kSwipeUp] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 42) gestureType:kSwipeDown] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 44) gestureType:kSwipeLeft] retain]];
    
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 48) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 49) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 50) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 51) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 52) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 53) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 54) gestureType:kSwipeLeft] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 55) gestureType:kSwipeRight] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 56) gestureType:kSwipeUp] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 58) gestureType:kSwipeDown] retain]];
    [_beatsArray addObject:[[[beatNGesture alloc] init:(__time + interval * 60) gestureType:kSwipeLeft] retain]];
    
    for (int i = 0; i < _beatsArray.count; i++) {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        GestureType gestureType = beat.gestureType;
        CCNode *node = nil;
        if (gestureType == kSwipeLeft) {
            node = [CCBReader nodeGraphFromFile:@"leftHint.ccbi"];
        } else if (gestureType == kSwipeUp) {
            node = [CCBReader nodeGraphFromFile:@"upHint.ccbi"];
        } else if (gestureType == kSwipeDown) {
            node = [CCBReader nodeGraphFromFile:@"downHint.ccbi"];
        } else {
            node = [CCBReader nodeGraphFromFile:@"rightHint.ccbi"];
        }
        node.visible = NO;
        [beat setGestureNode:node];
        [self addChild:node];
    }
    
    animationManager = self.userObject;
    animationManager.delegate = self;
    
    self.previousPageCCBI = @"Lou5.ccbi";
    self.nextPageCCBI = @"Lou7.ccbi";
    self.backgroundMusic = @"clean.mp3";
    
    [self setFlipBtns:YES enableNextBtn:YES];
    
    danceBGMAudioSource = (CDLongAudioSource*)[[CDLongAudioSource alloc] init];
    
    [self scheduleUpdate];
}

- (void)update:(ccTime)dt {
    if (_gameState == kGamePlay)
    {
        [self updateGameTime];
        CCLOG(@"%f", _gameTime);
        if (isCountDownOver == FALSE)
            [self updateCountDown:_gameTime];
        else
            [self updateBeats:_gameTime];
    }
}

- (void)updateGameTime
{
    double newTime = CACurrentMediaTime();
    _gameTime = _gameTime + (newTime - _previousCurTime);
    _previousCurTime = newTime;
    
    if (_gameTime >= kGameTtlTime)
    {
        [self endDanceGame];
    }
}

- (void) updateCountDown:(float)curSongTime
{
    if (curSongTime > kCountDownTime){
        //CCLOG(@"ucd:endCountDown");
        [self endCountDown];
    }else{
        //[countDownLbl setString:@"yabe"];
        countDownLbl.string = [NSString stringWithFormat:@"%d", kCountDownTime - (int)curSongTime -1];
    }
}

- (void) updateBeats:(float)curSongTime
{
    for (int i = 0; i < _beatsArray.count; i++)
    {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        CCNode *node = [beat getGestureNode];
        GestureType gestureType = beat.gestureType;
        if (beat.songTime >= curSongTime + 1.35) {
            node.tag = 0;
            node.visible = NO;
        } else if (curSongTime - 0.45 <= beat.songTime && beat.songTime < curSongTime + 1.35) {
            if (node.tag == 0){
                // Update position
                float ratio = (beat.songTime - (curSongTime - 0.45)) / 0.45;
                //int opacity = 180 - 30 * ratio;
                float scale = 1.2 - 0.2 * ratio;
                float y = (-90) + 185 * ratio;
                float x = 0;
                if (gestureType == kSwipeLeft)
                    x = 70 + 50 * ratio;
                else if (gestureType == kSwipeRight)
                    x = 920 - 50 * ratio;
                else if (gestureType == kSwipeUp)
                    x = 350 + 20 * ratio;
                else if (gestureType == kSwipeDown)
                    x = 640 - 20 * ratio;
                node.position = ccp(x, y);
                node.scale = scale;
                //node.opacity = opacity;
                node.visible = YES;
            } else {
                node.visible = NO;
            }
        }
        else
        {
            node.tag = -1;
            node.visible = NO;
        }
    }
}

- (void) completedAnimationSequenceNamed:(NSString *)name
{
    //CCLOG(@"casn:%@", name);
    if ([name isEqual:@"Default Timeline"]) {
        self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP6.mp3"];
        [self showFlipBtns];
    } else if ([name isEqual:@"cdFadeIn"]) {
        [self startCountDown];
    } else if ([name isEqual:@"cdFadeOut"]) {
        [self startDanceGame];
    }
}

- (void) startIntroGame{
    self.storySound = [[SimpleAudioEngine sharedEngine] playEffect:@"louP6guide.mp3"];
    _gameState = kGameIntro;
    [animationManager runAnimationsForSequenceNamed:@"startIntro"];
}

- (void) onStartGameBtnPressed: (id) sender
{
    if (self.storySound) [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    [animationManager runAnimationsForSequenceNamed:@"cdFadeIn"];
}

- (void) startCountDown
{
    //CCLOG(@"startCountDown");
    [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
    
    isCountDownOver = FALSE;
    _gameTime = 0.0;
    _previousCurTime = CACurrentMediaTime();
    _gameState = kGamePlay;
    
    [danceBGMAudioSource load:@"Bo Peep.mp3"];
    [danceBGMAudioSource setNumberOfLoops:0];
    [danceBGMAudioSource play];
}

- (void) endCountDown
{
    //CCLOG(@"endCountDown");
    isCountDownOver = TRUE;
    [animationManager runAnimationsForSequenceNamed:@"cdFadeOut"];
    //[self startDanceGame];
}

- (void) startDanceGame
{
    //CCLOG(@"startDanceGame");
    [animationManager runAnimationsForSequenceNamed:@"Dance"];
    _gameScore = 0;
    _scrBar.scaleX = 0.1;
    for (int i = 0; i < _beatsArray.count; i++) {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        GestureType gestureType = beat.gestureType;
        CCNode *node = [beat getGestureNode];
        if (gestureType == kSwipeLeft) {
            node.position = ccp(230,555);
        } else if (gestureType == kSwipeUp) {
            node.position = ccp(432,555);
        } else if (gestureType == kSwipeDown) {
            node.position = ccp(592,555);
        } else {
            node.position = ccp(794,555);
        }
        //node.visible = NO;
        node.tag = 0;
    }

    _previousCurTime = CACurrentMediaTime();
    _gameState = kGamePlay;
}

- (void) resumeScene{
    CCLOG(@"Lou6:resumeScene");
    _leftBtn.isEnabled = TRUE;
    _rightBtn.isEnabled = TRUE;
    _upBtn.isEnabled = TRUE;
    _downBtn.isEnabled = TRUE;
    _passBtn.isEnabled = TRUE;
    _failBtn.isEnabled = TRUE;
    _introEndBtn.isEnabled = TRUE;
    
    if (_gameState == kGamePause)
    {
        _previousCurTime = CACurrentMediaTime();
        _gameState = kGamePlay;
        [[SimpleAudioEngine sharedEngine] pauseBackgroundMusic];
        [danceBGMAudioSource resume];
    }
    [super resumeScene];
}

- (void) pauseScene{
    CCLOG(@"Lou6:pauseScene");
    _leftBtn.isEnabled = FALSE;
    _rightBtn.isEnabled = FALSE;
    _upBtn.isEnabled = FALSE;
    _downBtn.isEnabled = FALSE;
    _passBtn.isEnabled = FALSE;
    _failBtn.isEnabled = FALSE;
    _introEndBtn.isEnabled = FALSE;
    
    if (_gameState == kGamePlay)
    {
        [danceBGMAudioSource pause];
        [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
        _gameState = kGamePause;
    }
    [super pauseScene];
}

- (void) endDanceGame{
    [danceBGMAudioSource stop];
    [[SimpleAudioEngine sharedEngine] resumeBackgroundMusic];
    
    if (_gameScore >= 14)
        [self winDanceGame];
    else
        [self lossDanceGame];
    
    
    int newLevel = 0;
    if (_gameScore >= 14 && _gameScore < 28) {
        newLevel = 1;
    } else if (_gameScore >= 28 && _gameScore < 42){
        newLevel = 2;
    } else if (_gameScore >= 42){
        newLevel = 3;
    }

    NSUserDefaults *userPrefs = [NSUserDefaults standardUserDefaults];
    int oldLevel = [userPrefs integerForKey:@"louStar"];
    if (newLevel > oldLevel)
    {
       [userPrefs setInteger:newLevel forKey:@"louStar"];
    }
    
    [userPrefs synchronize];
    
}

- (void) winDanceGame{
    [animationManager runAnimationsForSequenceNamed:@"startPass"];
    _gameState = kGameWin;
}

- (void) lossDanceGame{
    [animationManager runAnimationsForSequenceNamed:@"startFail"];
    _gameState = kGameOver;
}

- (void) replayDanceGame:(id)sender {
    [self startIntroGame];
}

- (void) onPrePgBtnPressed:(id)sender {
    [self go2PrePage];
}

- (void) onNextPgBtnPressed:(id)sender {
    if (self.storySound) [[SimpleAudioEngine sharedEngine] stopEffect:storySound];
    [self hideFlipBtns];
    [self startIntroGame];
}

- (void) onFinishBtnPressed: (id) sender {
    [self go2NextPage];
}

- (void) clickLeftBtn:(id)sender{
    if (_gameState != kGamePlay)
        return;

    for (int i = 0; i < _beatsArray.count; i++)
    {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        CCNode *node = [beat getGestureNode];
        if (CGRectIntersectsRect(node.boundingBox, _leftBtn.boundingBox) && node.tag == 0) {
            node.tag = 1;
            //node.visible = NO;
            CCBAnimationManager *animationManager2 = node.userObject;
            [animationManager2 runAnimationsForSequenceNamed:@"fadeOut"];
            [self getHit];
            return;
        }
    }
    [self missHit];
}

- (void) clickRightBtn:(id)sender{
    if (_gameState != kGamePlay)
        return;
    
    for (int i = 0; i < _beatsArray.count; i++)
    {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        CCNode *node = [beat getGestureNode];
        if (CGRectIntersectsRect(node.boundingBox, _rightBtn.boundingBox) && node.tag == 0) {
            node.tag = 1;
            //node.visible = NO;
            CCBAnimationManager *animationManager2 = node.userObject;
            [animationManager2 runAnimationsForSequenceNamed:@"fadeOut"];
            [self getHit];
            return;
        }
    }
    [self missHit];
}

- (void) clickUpBtn:(id)sender{
    if (_gameState != kGamePlay)
        return;
    
    for (int i = 0; i < _beatsArray.count; i++)
    {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        CCNode *node = [beat getGestureNode];
        if (CGRectIntersectsRect(node.boundingBox, _upBtn.boundingBox) && node.tag == 0) {
            node.tag = 1;
            //node.visible = NO;
            CCBAnimationManager *animationManager2 = node.userObject;
            [animationManager2 runAnimationsForSequenceNamed:@"fadeOut"];
            [self getHit];
            return;
        }
    }
    [self missHit];
}

- (void) clickDownBtn:(id)sender{
    if (_gameState != kGamePlay)
        return;
    
    for (int i = 0; i < _beatsArray.count; i++)
    {
        beatNGesture *beat = [_beatsArray objectAtIndex:i];
        CCNode *node = [beat getGestureNode];
        if (CGRectIntersectsRect(node.boundingBox, _downBtn.boundingBox) && node.tag == 0)
        {
            node.tag = 1;
            //node.visible = NO;
            CCBAnimationManager *animationManager2 = node.userObject;
            [animationManager2 runAnimationsForSequenceNamed:@"fadeOut"];
            [self getHit];
            return;
        }
    }
    [self missHit];
}

- (void) missHit {
    [self showMissHint];
}

- (void) getHit {
    [self showGoodHint];
    [self addScore];
}

- (void) showMissHint{
    CCBAnimationManager *animationManager2 = _hitHint.userObject;
    [animationManager2 runAnimationsForSequenceNamed:@"miss"];
}

- (void) showGoodHint{
    CCBAnimationManager *animationManager2 = _hitHint.userObject;
    [animationManager2 runAnimationsForSequenceNamed:@"good"];
}

- (void) addScore{
    int newGameScore = _gameScore + 1;
    if (_gameScore < 14 && newGameScore >= 14){
        CCBAnimationManager *animationManager2 = _scrBarStar1.userObject;
        [animationManager2 runAnimationsForSequenceNamed:@"FadeIn"];
    } else if (_gameScore < 28 && newGameScore >= 28){
        CCBAnimationManager *animationManager2 = _scrBarStar2.userObject;
        [animationManager2 runAnimationsForSequenceNamed:@"FadeIn"];
    } else if (_gameScore < 42 && newGameScore >= 42){
        CCBAnimationManager *animationManager2 = _scrBarStar3.userObject;
        [animationManager2 runAnimationsForSequenceNamed:@"FadeIn"];
    }
    _gameScore = newGameScore;
    float scale = 0.1 + 0.9 * (_gameScore/42.0);
    _scrBar.scaleX = min(1.0, scale);
}

@end
