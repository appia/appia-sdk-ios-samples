//
//  APPostViewController.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostViewController.h"
#import "APPost.h"
#import "APPostView.h"
#import "APImageView.h"
#import <AppiaSDK/Appia.h>

@interface APPostViewController ()
{
    APPostView *postView;
    UIScrollView *scrollView;
    AIBannerAd *bannerAd;
}
@end

@implementation APPostViewController

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
	// Do any additional setup after loading the view.
    
    //initialize the banner ad
    bannerAd = [[AIAppia sharedInstance] createBannerAdWithSize:AIBannerAdFullScreen];
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height - 44.0)];
    [scrollView setAlwaysBounceVertical:YES];
    [[self view] addSubview:scrollView];
    
    postView = [[APPostView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 300.0)];
    [scrollView addSubview:postView];
    
    [[[[self navigationController] navigationBar] backItem] setTitle:@"Posts"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect f = postView.frame;
    [postView setFrame:CGRectMake(f.origin.x, f.origin.y, f.size.width, [[self post] heightForPostWithComments])];
    [postView setPost:[self post] withSelectedPhoto:self.selectedPhoto];
    [postView setCommentsVisible:YES];
        
    [scrollView setContentSize:CGSizeMake(postView.frame.size.width, postView.frame.size.height)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //show the banner ad
    [bannerAd presentFromMainWindow];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
