//
//  AIAd.h
//  AppiaSDK
//
//  Created by Otto Hammersmith on 3/1/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
@class AIAdParameters;

@interface AIAd : NSObject

@property (nonatomic,strong) AIAdParameters *adParameters;

- (void)presentInView:(UIView *)view;
- (void)presentFromMainWindow;
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;

- (void)refresh;
- (void)dismiss;

- (void)willAppear;
- (void)didDisappear;

@end
