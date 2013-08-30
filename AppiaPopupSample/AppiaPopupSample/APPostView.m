//
//  APPostView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostView.h"
#import "APPost.h"
#import "APCommentView.h"
#import "APComment.h"
#import "APImageView.h"
#import <QuartzCore/QuartzCore.h>

@interface APPostView ()
{
    UILabel *ownerLabel, *dateLabel, *postTextLabel, *commentsLabel;
    UIView *postView, *commentsNumberView, *commentsView;
    UIImageView *picView;
    UIScrollView *photoView;
    APPost *postData;
    
}

@end

@implementation APPostView

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
        [[postView layer] setBorderColor:[[UIColor colorWithWhite:0.6 alpha:1.0] CGColor]];
        [[postView layer] setBorderWidth:1.0];
        [self addSubview:postView];
       
        picView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 10.0, 40.0, 40.0)];
        [picView setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
        [postView addSubview:picView];
        
        ownerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 10.0, 100.0, 20.0)];
        [ownerLabel setBackgroundColor:[UIColor clearColor]];
        [ownerLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:13.0]];
        [ownerLabel setTextColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
        [postView addSubview:ownerLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(60.0, 27.0, 100.0, 15.0)];
        [dateLabel setBackgroundColor:[UIColor clearColor]];
        [dateLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:10.0]];
        [dateLabel setTextColor:[UIColor colorWithWhite:0.5 alpha:1.0]];
        [postView addSubview:dateLabel];
        
        postTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 60.0, postView.frame.size.width - 20.0, 65.0)];
        [postTextLabel setBackgroundColor:[UIColor clearColor]];
        [postTextLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:15.0]];
        [postTextLabel setTextColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
        [postTextLabel setNumberOfLines:0];
        [postTextLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [postView addSubview:postTextLabel];
        
        //a view for the number of comments
        commentsNumberView = [[UIView alloc] initWithFrame:CGRectMake(0.0, postView.frame.size.height - 25.0, postView.frame.size.width, 25.0)];
        [commentsNumberView setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin];
        [commentsNumberView setBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1.0]];
        [postView addSubview:commentsNumberView];

        UIView *commentsSep = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, commentsNumberView.frame.size.width, 1.0)];
        [commentsSep setBackgroundColor:[UIColor colorWithWhite:0.6 alpha:1.0]];
        [commentsNumberView addSubview:commentsSep];
        
        commentsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, postView.frame.size.width - 20.0, commentsNumberView.frame.size.height)];
        [commentsLabel setBackgroundColor:[UIColor clearColor]];
        [commentsLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:10.0]];
        [commentsLabel setTextColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
        [commentsNumberView addSubview:commentsLabel];
        
        //a view for the comments
        commentsView = [[UIView alloc] initWithFrame:CGRectZero];
        [commentsView setBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1.0]];
        [commentsView setHidden:YES];
        [postView addSubview:commentsView];
        
        //a scrollview for the photos
        photoView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        [[photoView layer] setMasksToBounds:NO];
        [photoView setShowsHorizontalScrollIndicator:NO];
        [photoView setPagingEnabled:YES];
        [photoView setHidden:YES];
        [self addSubview:photoView];        
    }
    return self;
}

- (void)setPost:(APPost *)post
{
    [self setPost:post withSelectedPhoto:nil];
}

- (void)setPost:(APPost *)post withSelectedPhoto:(APImageView *)photoToSelect
{
    postData = post;
    
    [ownerLabel setText:[post owner]];
    [picView setImage:[post pictureImage]];
    [dateLabel setText:[post date]];
    [postTextLabel setText:[post text]];
    [postTextLabel sizeToFit];
    
    NSArray *comments = [post comments];
    
    NSString *com = ([comments count] > 1 || [comments count] == 0 ? @"comments" : @"comment");
    
    [commentsLabel setText:[NSString stringWithFormat:@"%i %@", [comments count], com]];
    
    NSArray *photos = post.photos;
    if ([photos count] > 0)
    {
        CGFloat xOffset = 2.0;
        CGFloat scrollOffsetX = 2.0;
        for (NSString *photoPath in photos)
        {
            APImageView *view = [[APImageView alloc] initWithImage:[UIImage imageNamed:photoPath]];
            [view setUserInteractionEnabled:YES];
            [view setPath:photoPath];
            [view setFrame:CGRectMake(xOffset, 0.0, 280.0, 280.0)];
            [photoView addSubview:view];
            
            if (photoToSelect && [photoPath isEqualToString:[photoToSelect path]])
            {
                scrollOffsetX = xOffset - 2.0;
            }
            
            //add a tap recognizer
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedPhoto:)];
            [tap setNumberOfTapsRequired:1];
            [view addGestureRecognizer:tap];
            
            xOffset += view.frame.size.width + 8.0;
        }
        [photoView setFrame:CGRectMake(postView.frame.origin.x + 10.0, postView.frame.origin.y + postTextLabel.frame.origin.y + postTextLabel.frame.size.height + 10.0, 288.0, 300.0)];
        [photoView setContentSize:CGSizeMake(xOffset, 280.0)];
        [photoView setContentOffset:CGPointMake(scrollOffsetX, 0.0) animated:NO];
        [photoView setHidden:NO];        
    }
}

- (void)setPostBackgroundColor:(UIColor *)color
{
    [postView setBackgroundColor:color];
}

- (void)setCommentsVisible:(BOOL)visible
{
    //remove all the subviews from the comments view
    [[commentsView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (visible)
    {
        [commentsNumberView setHidden:YES];
                
        CGFloat yOffset = 0.0;
        for (APComment *comment in [postData comments])
        {
            APCommentView *view = [[APCommentView alloc] initWithFrame:CGRectMake(0.0, yOffset, postView.frame.size.width, [comment heightForComment])];
            [view setComment:comment];
            [commentsView addSubview:view];
            
            yOffset += view.frame.size.height;
        }
        
        if ([[postData comments] count] == 0)
        {
            APCommentView *view = [[APCommentView alloc] initWithFrame:CGRectMake(0.0, yOffset, postView.frame.size.width, 30.0)];
            [view setComment:nil];
            [commentsView addSubview:view];
            
            yOffset += view.frame.size.height;
        }
        
        CGFloat commentsOrigin = postTextLabel.frame.origin.y + postTextLabel.frame.size.height + 10.0;
        if ([[postData photos] count] > 0)
        {
            commentsOrigin += 290.0;
        }
        
        [commentsView setFrame:CGRectMake(0.0, commentsOrigin, postView.frame.size.width, yOffset)];
        [postView bringSubviewToFront:commentsView];
        [commentsView setHidden:NO];
    }
}

- (void)tappedPhoto:(UITapGestureRecognizer *)gr
{
    APImageView *photo = (APImageView *)[gr view];
    [self.delegate tappedPhoto:photo];
}

@end
