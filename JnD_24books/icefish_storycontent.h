//
//  icefish_storycontent.h
//  JnD_24books
//
//  Created by Jerry on 13/6/3.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface storyEvent : NSObject{
    SEL eventHandler;
    NSString *subtitle;
    NSString *music;
}

@property (nonatomic,assign) NSString *subtitle;
@property (nonatomic,assign) NSString *music;

@end

@interface icefish_storycontent : CCSprite {
    
}

@end
