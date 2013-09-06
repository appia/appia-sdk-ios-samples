//
//  AIAd.h
//  AppiaSDK
//
//  Created by Otto Hammersmith on 3/1/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface AIAd : NSObject 

- (void)presentFromMainWindow;
- (void)dismiss;
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration;

@end
