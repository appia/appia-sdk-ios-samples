//
//  APCommentView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APCommentView.h"
#import "APComment.h"

@interface APCommentView ()
{
    UILabel *ownerLabel, *textLabel, *dateLabel, *noCommentLabel;
    UIImageView *faceView;
}

@end

@implementation APCommentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        //add a separator line
        UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, 1.0)];
        [sep setBackgroundColor:[UIColor colorWithWhite:0.75 alpha:1.0]];
        [self addSubview:sep];
        
        CGFloat xOffset = 40.0;
        
        faceView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 8.0, 20.0, 20.0)];
        [self addSubview:faceView];
        
        //init the labels
        ownerLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, 6.0, self.frame.size.width - (xOffset * 2.0), 15.0)];
        [ownerLabel setBackgroundColor:[UIColor clearColor]];
        [ownerLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:10.0]];
        [ownerLabel setTextColor:[UIColor colorWithWhite:0.3 alpha:1.0]];
        [self addSubview:ownerLabel];
        
        textLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, 21.0, self.frame.size.width - (xOffset * 2.0), 0.0)];
        [textLabel setBackgroundColor:[UIColor clearColor]];
        [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:13.0]];
        [textLabel setTextColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
        [textLabel setNumberOfLines:0];
        [textLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [self addSubview:textLabel];
        
        dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, self.frame.size.height - 20.0, self.frame.size.width - (xOffset * 2.0), 15.0)];
        [dateLabel setBackgroundColor:[UIColor clearColor]];
        [dateLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:10.0]];
        [dateLabel setTextColor:[UIColor colorWithWhite:0.5 alpha:1.0]];
        [self addSubview:dateLabel];
        
        noCommentLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, self.frame.size.width - 20.0, self.frame.size.height)];
        [noCommentLabel setBackgroundColor:[UIColor clearColor]];
        [noCommentLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:13.0]];
        [noCommentLabel setTextColor:[UIColor colorWithWhite:0.2 alpha:1.0]];
        [self addSubview:noCommentLabel];
    }
    return self;
}

- (void)setComment:(APComment *)comment
{
    if (comment)
    {
        [ownerLabel setText:comment.owner];
        [faceView setImage:[comment pictureImage]];
        [dateLabel setText:comment.date];
        [textLabel setText:comment.text];
        [textLabel sizeToFit];
    }
    else
    {
        [self setIsNoComment];
    }
}

- (void)setIsNoComment
{
    [faceView setHidden:YES];
    [noCommentLabel setText:@"No comments."];
}

@end
