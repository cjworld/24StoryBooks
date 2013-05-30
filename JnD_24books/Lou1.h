//
//  Lou1.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/4/17.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "LouLaiZuePageLayer.h"
#import "p1_horse.h"
#import "p1_warrior.h"

@interface Lou1 : LouLaiZuePageLayer {
    p1_horse *horse;
    p1_warrior *warrior;
}

- (void)onExitTransitionDidStart;

@end
