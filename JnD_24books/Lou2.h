//
//  Lou2.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/19.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LouLaiZuePageLayer.h"
#import "p2_father.h"

@interface Lou2 : LouLaiZuePageLayer {
    p2_father *father;
}

- (void)onExitTransitionDidStart;

@end
