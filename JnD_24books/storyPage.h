//
//  storyPage.h
//  JnD_24books
//
//  Created by Chen Bo Wei on 13/6/4.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface storyPage : CCSprite {
    
    
    NSString * curString;
    
    NSMutableArray * pageString;
    NSMutableArray * pageSound;
    NSMutableArray * pageNotify;
    NSMutableArray * pageAnimation;
    
    
    NSString * stage;
}


-(void) init;
-(void) onClose;


@end	
