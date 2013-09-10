//
//  APPostViewDelegate.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/30/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APImageView;

@protocol APPostViewDelegate <NSObject>

- (void)tappedPhoto:(APImageView *)photo;

@end
