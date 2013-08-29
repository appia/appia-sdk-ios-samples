//
//  APPostView.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APPost;

@interface APPostView : UIView

- (void)setPost:(APPost *)post;

- (void)setPostBackgroundColor:(UIColor *)color;

- (void)setCommentsVisible:(BOOL)visible;

@end
