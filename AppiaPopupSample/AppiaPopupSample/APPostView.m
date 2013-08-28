//
//  APPostView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostView.h"
#import "APPost.h"

@interface APPostView ()
{
    UILabel *ownerLabel, *dateLabel, *postTextLabel;
}

@end

@implementation APPostView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIView *postView = [[UIView alloc] initWithFrame:CGRectMake(5.0, 5.0, self.frame.size.width - 10.0, self.frame.size.height - 5.0)];
        [postView setBackgroundColor:[UIColor whiteColor]];
        [[postView layer] setCornerRadius:3.0];
        [[postView layer] setBorderColor:[[UIColor colorWithWhite:0.6 alpha:1.0] CGColor]];
        [[postView layer] setBorderWidth:1.0];
        [self addSubview:postView];
        
        UIView *picView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 10.0, 40.0, 40.0)];
        [picView setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
        [postView addSubview:picView];
        
        ownerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 10.0, 100.0, 15.0)];
        [ownerLabel setBackgroundColor:[UIColor clearColor]];
        [ownerLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:10.0]];
        [ownerLabel setTextColor:[UIColor darkGrayColor]];
        [postView addSubview:ownerLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 25.0, 100.0, 15.0)];
        [dateLabel setBackgroundColor:[UIColor clearColor]];
        [dateLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:10.0]];
        [dateLabel setTextColor:[UIColor lightGrayColor]];
        [postView addSubview:dateLabel];
        
        postTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 60.0, 290.0, 75.0)];
        [postTextLabel setBackgroundColor:[UIColor clearColor]];
        [postTextLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
        [postTextLabel setTextColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
        [postTextLabel setNumberOfLines:0];
        [postTextLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [postView addSubview:postTextLabel];
        
    }
    return self;
}

- (void)setPost:(APPost *)post
{
    [ownerLabel setText:[post owner]];
    [dateLabel setText:[post date]];
    [postTextLabel setText:[post text]];
    [postTextLabel sizeToFit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
