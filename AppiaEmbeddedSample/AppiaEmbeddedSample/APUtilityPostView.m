//
//  APUtilityPostView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 9/6/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APUtilityPostView.h"
#import "APUtilityPost.h"
#import <QuartzCore/QuartzCore.h>

@interface APUtilityPostView ()
{
    UIView *postView;
    UILabel *utilityLabel;
}

@end

@implementation APUtilityPostView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        
        // Initialization code
        postView = [[UIView alloc] initWithFrame:CGRectMake(8.0, 8.0, self.frame.size.width - 16.0, self.frame.size.height - 16.0)];
        [postView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        [postView setBackgroundColor:[UIColor colorWithWhite:0.85 alpha:1.0]];
        [[postView layer] setCornerRadius:3.0];
        [[postView layer] setMasksToBounds:YES];
        [[postView layer] setBorderColor:[[UIColor colorWithWhite:0.75 alpha:1.0] CGColor]];
        [[postView layer] setBorderWidth:1.0];
        [self addSubview:postView];
        
        utilityLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, postView.frame.size.width, postView.frame.size.height)];
        [utilityLabel setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        [utilityLabel setBackgroundColor:[UIColor clearColor]];
        [utilityLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0]];
        [utilityLabel setTextColor:[UIColor blackColor]];
        [utilityLabel setTextAlignment:NSTextAlignmentCenter];
        [postView addSubview:utilityLabel];
    }
    return self;
}

- (void)setPost:(APPost *)utilityPost
{
    [utilityLabel setText:utilityPost.text];
}

- (void)setPostBackgroundColor:(UIColor *)backgroundColor
{
    //[postView setBackgroundColor:backgroundColor];
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
