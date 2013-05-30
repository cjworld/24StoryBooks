//
//  LouLaiZuePageLayer.h
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "cocos2d.h"
#import "CCBReader.h"

@interface flipPageLayer : CCLayer{
    CCMenuItemImage *sp_prePageBtn;
    CCMenuItemImage *sp_nextPageBtn;
    BOOL isPrePageBtnDisplayed;
    BOOL isNextPageBtnDisplayed;
        
}

- (void) setBtns:(BOOL) _enablePreBtn enableNextBtn:(BOOL)_enableNextBtn;
- (void) hideBtns;
- (void) showBtns;
- (void) disableBtns;
- (void) enableBtns;


@end
