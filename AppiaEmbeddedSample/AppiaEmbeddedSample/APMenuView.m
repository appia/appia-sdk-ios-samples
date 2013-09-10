//
//  APMenuView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APMenuView.h"
#import <QuartzCore/QuartzCore.h>

@interface APMenuView ()
{
    UILabel *menuText;
    UIColor *bgColor, *highlightColor;
}

@end

@implementation APMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        bgColor = [UIColor colorWithWhite:0.2 alpha:1.0];
        highlightColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        
        [self setBackgroundColor:bgColor];
        
        //separator
        UIView *sep = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height, self.frame.size.width, 1.0)];
        [sep setBackgroundColor:[UIColor colorWithWhite:0.4 alpha:1.0]];
        [self addSubview:sep];
        
        menuText = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 0.0, self.frame.size.width, self.frame.size.height)];
        [menuText setBackgroundColor:[UIColor clearColor]];
        [menuText setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:15.0]];
        [menuText setTextColor:[UIColor whiteColor]];
        [self addSubview:menuText];
        
        [self addTarget:self action:@selector(handleTap) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(highlight) forControlEvents:UIControlEventTouchDown|UIControlEventTouchDragEnter];
        [self addTarget:self action:@selector(clearHighlight) forControlEvents:UIControlEventTouchUpInside|UIControlEventTouchUpOutside|UIControlEventTouchDragExit|UIControlEventTouchCancel];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    [menuText setText:title];
}

- (void)highlight
{
    [self setBackgroundColor:highlightColor];
}

- (void)clearHighlight
{
    [UIView animateWithDuration:0.2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        [self setBackgroundColor:bgColor];
    } completion:NULL];
}

- (void)handleTap
{
    [self.delegate menuViewDidReceiveTap:self];
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
