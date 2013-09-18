//
//  APMenuViewController.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APMenuViewController.h"
#import "APMenuView.h"
#import "ECSlidingViewController.h"
#import <AppiaSDK/Appia.h>

@interface APMenuViewController ()
{
    AIAppWall *appWall;
}

@end

@implementation APMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    
    //create the app wall object
    appWall = [[AIAppia sharedInstance] createAppWall];
    
    UIView *root = [[UIView alloc] initWithFrame:CGRectMake(0.0, 20.0, 320.0, self.view.frame.size.height)];
    [root setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
    [[self view] addSubview:root];
    
    //name view
    UIImageView *faceImg = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, 50.0, 50.0)];
    [faceImg setImage:[UIImage imageNamed:@"blue.png"]];
    [root addSubview:faceImg];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(65.0, 40.0, 150.0, 20.0)];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:13.0]];
    [nameLabel setTextColor:[UIColor whiteColor]];
    [nameLabel setText:@"Brian Watkins"];
    [root addSubview:nameLabel];
    
    UIView *menuHolder = [[UIView alloc] initWithFrame:CGRectMake(0.0, 70.0, 320.0, self.view.frame.size.height)];
    [root addSubview:menuHolder];
    
	// Do any additional setup after loading the view.
    NSArray *menuItems = [NSArray arrayWithObjects:@"Friends", @"Groups", @"Fun stuff", @"More apps", nil];
    
    CGFloat yOffset = 0.0;
    NSInteger tagNumber = 0;
    for (NSString *menuText in menuItems)
    {
        APMenuView *menuView = [[APMenuView alloc] initWithFrame:CGRectMake(0.0, yOffset, menuHolder.frame.size.width, 45.0)];
        [menuView setDelegate:self];
        [menuView setTitle:menuText];
        [menuView setTag:tagNumber++];
        
        [menuHolder addSubview:menuView];
        
        yOffset += menuView.frame.size.height + 1.0;
    }
    
    //sep
    UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0.0, menuHolder.frame.origin.y, self.view.frame.size.width, 1.0)];
    [sep setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
    [root addSubview:sep];
    
}

- (void)menuViewDidReceiveTap:(APMenuView *)menuView
{
    if ([menuView tag] == 3)
    {
        [self.slidingViewController resetTopViewWithAnimations:NULL onComplete:^{
           
            //tapped the more apps button; pop up the AppWall!
            [appWall presentFromMainWindow];

        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
