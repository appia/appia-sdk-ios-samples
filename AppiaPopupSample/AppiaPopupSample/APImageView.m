//
//  APImageView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/30/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APImageView.h"
#import <QuartzCore/QuartzCore.h>

@implementation APImageView

- (id)initWithImage:(UIImage *)image
{
    self = [super initWithImage:image];
    if (self)
    {
        //[[self layer] setBorderColor:[[UIColor colorWithWhite:0.5 alpha:1.0] CGColor]];
        //[[self layer] setBorderWidth:1.0];
    }
    return self;
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
