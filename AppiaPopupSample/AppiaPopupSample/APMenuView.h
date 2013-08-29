//
//  APMenuView.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APMenuViewDelegate.h"

@interface APMenuView : UIButton

@property (nonatomic,assign) id <APMenuViewDelegate> delegate;

- (void)setTitle:(NSString *)title;

@end
