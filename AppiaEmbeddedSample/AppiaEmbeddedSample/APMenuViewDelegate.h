//
//  APMenuViewDelegate.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APMenuView;

@protocol APMenuViewDelegate <NSObject>

- (void)menuViewDidReceiveTap:(APMenuView *)menuView;

@end
