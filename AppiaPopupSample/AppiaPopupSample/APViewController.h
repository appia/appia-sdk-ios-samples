//
//  APViewController.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "APPostCellDelegate.h"

@interface APViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,APPostCellDelegate>

- (IBAction)showMenu:(id)sender;

@end
