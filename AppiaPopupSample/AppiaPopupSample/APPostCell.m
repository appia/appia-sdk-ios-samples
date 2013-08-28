//
//  APPostCell.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostCell.h"
#import "APPostView.h"
#import <QuartzCore/QuartzCore.h>

@interface APPostCell ()
{
    APPostView *postView;
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
        
        postView = [[APPostView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, 125.0)];
        [[self contentView] addSubview:postView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setPost:(APPost *)post
{
    [postView setPost:post];
}

@end
