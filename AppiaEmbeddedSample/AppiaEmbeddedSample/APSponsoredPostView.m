//
//  APSponsoredPostView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 9/6/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APSponsoredPostView.h"
#import "APPost.h"
#import "APSponsoredPost.h"
#import <QuartzCore/QuartzCore.h>
#import <AppiaSDK/Appia.h>

@interface APSponsoredPostView ()
{
    UIView *postView, *adView;
    AIAppWall *appWall;
}

@end

@implementation APSponsoredPostView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        
        postView = [[UIView alloc] initWithFrame:CGRectMake(8.0, 8.0, self.frame.size.width - 16.0, self.frame.size.height - 16.0)];
        [postView setAutoresizingMask:UIViewAutoresizingFlexibleHeight];
        [postView setBackgroundColor:[UIColor whiteColor]];
        [[postView layer] setCornerRadius:3.0];
        [[postView layer] setMasksToBounds:YES];
        [[postView layer] setBorderColor:[[UIColor colorWithWhite:0.75 alpha:1.0] CGColor]];
        [[postView layer] setBorderWidth:1.0];
        [self addSubview:postView];
        
        UILabel *l = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 5.0, postView.frame.size.width - 20.0, 20.0)];
        [l setBackgroundColor:[UIColor clearColor]];
        [l setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0]];
        [l setTextColor:[UIColor darkGrayColor]];
        [l setText:@"Sponsored Post"];
        [postView addSubview:l];
        
        //an area for the ad
        adView = [[UIView alloc] initWithFrame:CGRectMake(5.0, 30.0, postView.frame.size.width - 10.0, 102.0)];
        [postView addSubview:adView];
        
        //initialize the app wall
        appWall = [[AIAppia sharedInstance] createAppWall];
    }
    return self;
}

- (void)setPost:(APPost *)post
{
    //APSponsoredPost *sponsoredPost = (APSponsoredPost *)post;
    
    //present the app wall in the ad view
    [appWall presentInView:adView];
    
    /*
    UILabel *adText = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, adView.frame.size.width, adView.frame.size.height)];
    [adText setBackgroundColor:[UIColor clearColor]];
    [adText setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:21.0]];
    [adText setTextColor:[UIColor whiteColor]];
    [adText setText:@"Tap to find cool new apps!"];
    [adText setTextAlignment:NSTextAlignmentCenter];
    [adView addSubview:adText];
    
    [adView setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:150.0/255.0 blue:0.0/255.0 alpha:1.0]];
     */
}

- (void)setPostBackgroundColor:(UIColor *)color
{
    [postView setBackgroundColor:color];
}

@end
