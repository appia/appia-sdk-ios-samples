//
//  APPostable.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 9/6/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APPost;

@protocol APPostable <NSObject>

- (void)setPost:(APPost *)post;

- (void)setPostBackgroundColor:(UIColor *)color;

@end
