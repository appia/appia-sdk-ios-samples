//
//  APViewController.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APViewController.h"
#import "APPostFactory.h"
#import "APPost.h"
#import "APPostCell.h"
#import "APPostViewController.h"
#import "APImageView.h"

@interface APViewController ()
{
    NSArray *posts;
    NSIndexPath *selectedPostIndex;
    APImageView *selectedPhoto;
    UITableView *postTable;
}

@end

@implementation APViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //load the posts
    NSString *postFile = [[NSBundle mainBundle] pathForResource:@"postData" ofType:@"plist"];
    APPostFactory *postFactory = [[APPostFactory alloc] initWithPostFile:postFile];
    posts = [postFactory posts];
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    
    //fix up the nav bar
    UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    [b setImage:[UIImage imageNamed:@"menu_button.png"] forState:UIControlStateNormal];
    [b addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
    [b setImageEdgeInsets:UIEdgeInsetsMake(0.0, -3.0, 0.0, 3.0)];
    [b setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *menuButton = [[UIBarButtonItem alloc] initWithCustomView:b];
    [[self navigationItem] setLeftBarButtonItem:menuButton];

    UIButton *a = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    [a setImage:[UIImage imageNamed:@"add_button.png"] forState:UIControlStateNormal];
    //[b addTarget:self action:@selector(ad:) forControlEvents:UIControlEventTouchUpInside];
    [a setImageEdgeInsets:UIEdgeInsetsMake(0.0, 3.0, 0.0, -3.0)];
    [a setShowsTouchWhenHighlighted:YES];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithCustomView:a];
    [[self navigationItem] setRightBarButtonItem:addButton];

    //set a back button for me
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Posts"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:nil
                                                                  action:nil];
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    //for iOS 7
    //[[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    //[[[self navigationController] navigationBar] setTranslucent:NO];
    
    postTable = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, self.view.frame.size.height - 44.0) style:UITableViewStylePlain];
    [postTable setDataSource:self];
    [postTable setDelegate:self];
    [postTable setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [postTable setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    [[self view] addSubview:postTable];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:NSClassFromString(@"APMenuViewController")])
    {
	    self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.slidingViewController.panGesture setEnabled:YES];
    [self.navigationController.view addGestureRecognizer:self.slidingViewController.panGesture];

    self.navigationController.view.layer.shadowOpacity = 0.75f;
    self.navigationController.view.layer.shadowRadius = 10.0f;
    self.navigationController.view.layer.shadowColor = [UIColor blackColor].CGColor;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if (selectedPostIndex)
    {
        [postTable deselectRowAtIndexPath:selectedPostIndex animated:YES];
        selectedPostIndex = nil;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //turn off the gesture recognizer
    [self.slidingViewController.panGesture setEnabled:NO];
    
    //present the view controller for viewing a post
    APPostViewController *postVC = [segue destinationViewController];
    [postVC setPost:[posts objectAtIndex:[selectedPostIndex row]]];
    
    if (selectedPhoto)
    {
        [postVC setSelectedPhoto:selectedPhoto];
        selectedPhoto = nil;
    }
}

- (IBAction)showMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)photoTapped:(APImageView *)photo inPostCell:(APPostCell *)cell
{
    selectedPhoto = photo;
    
    //select the cell
    NSIndexPath *index = [postTable indexPathForCell:cell];    
    [postTable selectRowAtIndexPath:index animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:postTable didSelectRowAtIndexPath:index];
}

#pragma mark - TableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [posts count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[posts objectAtIndex:indexPath.row] heightForPost];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    APPostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"postCell"];
    
    if (!cell)
    {
        cell = [[APPostCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        [cell setDelegate:self];
    }
    
    [cell setPost:[posts objectAtIndex:indexPath.row]];
    
    return cell;
}

#pragma mark - TableViewDelegate methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedPostIndex = indexPath;
    [self performSegueWithIdentifier:@"seguePostView" sender:self];
}

@end
