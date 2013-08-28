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

@interface APViewController ()
{
    NSArray *posts;
    NSIndexPath *selectedPostIndex;
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
    
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    [[[self navigationController] navigationBar] setTranslucent:NO];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, self.view.frame.size.height - 64.0) style:UITableViewStylePlain];
    [tableView setDataSource:self];
    [tableView setDelegate:self];
    [tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableView setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0]];
    [[self view] addSubview:tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //present the view controller for viewing a post
    APPostViewController *postVC = [segue destinationViewController];
    [postVC setPost:[posts objectAtIndex:[selectedPostIndex row]]];
}

#pragma mark - TableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [posts count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 125.0;
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
