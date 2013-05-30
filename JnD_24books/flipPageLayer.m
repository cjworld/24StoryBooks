//
//  LouLaiZuePageLayer.m
//  JnD_24books
//
//  Created by Jerry on 13/3/26.
//
//

#import "flipPageLayer.h"

#define MAX_PAGE 7

@implementation flipPageLayer


-(void) didLoadFromCCB  {
    //sp_prePageBtn.visible = NO;
    //sp_nextPageBtn.visible = NO;
    //isPrePageBtnDisplayed = NO;
    //isNextPageBtnDisplayed = NO;
    CCLOG(@">>>>> flipPageLayer: didLoadFromCCB");
    
}

- (void) setBtns:(BOOL) _enablePreBtn enableNextBtn:(BOOL)_enableNextBtn
{
    CCLOG(@">>>>> flipPageLayer: setBtns");
    isPrePageBtnDisplayed = _enablePreBtn;
    isNextPageBtnDisplayed = _enableNextBtn;
}

- (void) showBtns
{
    CCLOG(@">>>>> flipPageLayer: showBtns");
    CCLOG(isPrePageBtnDisplayed ? @"isPrePageBtnDisplayed: Yes" : @"isPrePageBtnDisplayed: No");
    CCLOG(isNextPageBtnDisplayed ? @"isNextPageBtnDisplayed: Yes" : @"isNextPageBtnDisplayed: No");
    CCLOG(sp_prePageBtn.isEnabled ? @"sp_prePageBtn.isEnabled: Yes" : @"sp_prePageBtn.isEnabled: No");
    CCLOG(sp_nextPageBtn.isEnabled ? @"sp_nextPageBtn.isEnabled: Yes" : @"sp_nextPageBtn.isEnabled: No");
    sp_prePageBtn.visible = isPrePageBtnDisplayed;
    sp_nextPageBtn.visible = isNextPageBtnDisplayed;
}

- (void) hideBtns
{
    sp_prePageBtn.visible = NO;    
    sp_nextPageBtn.visible = NO;
}

- (void) disableBtns
{
    sp_nextPageBtn.isEnabled = NO;
    sp_prePageBtn.isEnabled = NO;
}

- (void) enableBtns
{
    sp_nextPageBtn.isEnabled = YES;
    sp_prePageBtn.isEnabled = YES;
}

@end