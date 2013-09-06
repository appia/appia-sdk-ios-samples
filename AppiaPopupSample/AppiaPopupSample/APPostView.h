//
//  APPostView.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPostViewDelegate.h"
#import "APPostable.h"
@class APPost;
@class APImageView;

@interface APPostView : UIView <APPostable>

@property (nonatomic,assign) id <APPostViewDelegate> delegate;

- (void)setPost:(APPost *)post withSelectedPhoto:(APImageView *)photo;

- (void)setCommentsVisible:(BOOL)visible;

@end
