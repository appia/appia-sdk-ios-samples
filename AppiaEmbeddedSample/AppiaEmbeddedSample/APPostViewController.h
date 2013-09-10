//
//  APPostViewController.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class APPost;
@class APImageView;

@interface APPostViewController : UIViewController

@property (nonatomic,strong) APPost *post;
@property (nonatomic,strong) APImageView *selectedPhoto;

@end
