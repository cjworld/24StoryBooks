//
//  p1_warrior.m
//  JnD_24books
//
//  Created by Jerry on 13/5/16.
//  Copyright 2013年 __MyCompanyName__. All rights reserved.
//

#import "p1_warrior.h"


@implementation p1_warrior

@synthesize warriorBtn;

- (void) didLoadFromCCB
{
    animationManager = self.userObject;
}

-(void) onBtnPressed:(id) sender
{
    [animationManager runAnimationsForSequenceNamed:@"scream"];
}

@end
