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

@interface APPostViewController ()
{
    APPostView *postView;
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
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0]];
    
    postView = [[APPostView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 400.0)];
    [[self view] addSubview:postView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [postView setPost:[self post]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
