//
//  APPostCell.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostCell.h"
#import "APPostView.h"
#import "APImageView.h"
#import "APSponsoredPostView.h"
#import "APUtilityPostView.h"
#import "APPostable.h"
#import <QuartzCore/QuartzCore.h>

@interface APPostCell ()
{
    UIView <APPostable> *postableView;
    UIColor *highlightColor, *normalColor;
    APPost *post;
}


@end

@implementation APPostCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        [[self contentView] setBackgroundColor:[UIColor clearColor]];
        
        normalColor = [UIColor whiteColor];
        highlightColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    [UIView animateWithDuration:(animated ? 0.2 : 0.0) delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [postableView setPostBackgroundColor:(selected ? highlightColor : normalColor)];
    } completion:NULL];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    // Configure the view for the selected state
    [UIView animateWithDuration:(animated ? 0.2 : 0.0) delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [postableView setPostBackgroundColor:(highlighted ? highlightColor : normalColor)];
    } completion:NULL];
}

- (void)setPost:(APPost *)p
{
    post = p;
    
    if (postableView)
    {
        [postableView removeFromSuperview];
    }
        
    switch (post.type)
    {
        case APPostTypeStandard:
        {
            APPostView *postView = [[APPostView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
            [postView setDelegate:self];
            [postView setPostBackgroundColor:normalColor];
            
            postableView = postView;

            break;
        }
        case APPostTypeSponsored:
        {
            postableView = [[APSponsoredPostView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];

            break;
        }
        case APPostTypeUtility:
        {
            postableView = [[APUtilityPostView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
            
            break;
        }
    }

    [postableView setPost:post];
    
    [[self contentView] addSubview:postableView];
}

- (APPost *)post
{
    return post;
}

- (void)tappedPhoto:(APImageView *)photo
{
    [self.delegate photoTapped:photo inPostCell:self];
}

@end
