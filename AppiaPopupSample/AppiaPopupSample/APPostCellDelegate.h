//
//  APPostCellDelegate.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/30/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APImageView;
@class APPostCell;

@protocol APPostCellDelegate <NSObject>

- (void)photoTapped:(APImageView *)photo inPostCell:(APPostCell *)cell;

@end
