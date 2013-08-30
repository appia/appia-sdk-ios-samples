//
//  APPostCell.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APPost.h"
#import "APPostViewDelegate.h"
#import "APPostCellDelegate.h"

@interface APPostCell : UITableViewCell <APPostViewDelegate>

@property (nonatomic,assign) id <APPostCellDelegate> delegate;

- (void)setPost:(APPost *)post;

@end
