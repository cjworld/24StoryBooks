//
//  Lou3.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LouLaiZuePageLayer.h"
#import "SimpleAudioEngine.h"

@interface Lou3 : LouLaiZuePageLayer {
    ALuint * birdsound;
}

- (void)onExitTransitionDidStart;

@end
