//
//  APModalAppWallView.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 9/10/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APModalAppWallView.h"
#import <AppiaSDK/Appia.h>

@interface APModalAppWallView ()
{
    AIAppWall *appWall;
}

@end

@implementation APModalAppWallView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [self setHidden:YES];
        
        appWall = [[AIAppia sharedInstance] createAppWall];
    }
    return self;
}

- (void)presentAppWallAfterDelay:(NSTimeInterval)delay
{
    //add the view to the main window
    [[[UIApplication sharedApplication] keyWindow] addSubview:self];
    
    //add a view to cover the status bar
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 20.0)];
    [statusBarView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:statusBarView];
    
    //add the app wall to a view we can slide into place
    UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 20.0, 320.0, self.frame.size.height)];
    [self addSubview:adView];
    [appWall presentInView:adView];
    
    //add a cancel button in the top right corner
    UIButton *dismissButton = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)];
    [dismissButton setCenter:CGPointMake(CGRectGetMaxX(self.frame) - 4.0 - 22.0, 26.0)];
    [dismissButton setImage:[UIImage imageNamed:@"AppiaSDK.bundle/close_active.png"] forState:UIControlStateNormal];
    [dismissButton addTarget:self action:@selector(dismissModalAppWall) forControlEvents:UIControlEventTouchUpInside];
    [adView addSubview:dismissButton];
    
    //present the app wall modally after a short delay
    [self performSelector:@selector(presentModalAppWall) withObject:nil afterDelay:delay];
}

- (void)presentModalAppWall
{
    //position the initial app wall view for scrolling in from the bottom
    CGRect f = self.frame;
    [self setFrame:CGRectMake(f.origin.x, f.size.height, f.size.width, f.size.height)];
    [self setHidden:NO];
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        [self setFrame:f];
        
    } completion:NULL];    
}

- (void)dismissModalAppWall
{
    CGRect f = self.frame;
    
    [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        //slide it off the bottom
        [self setFrame:CGRectMake(f.origin.x, f.size.height + 50.0, f.size.width, f.size.height)];
        
    } completion:^(BOOL finished) {
        
        //dimiss app wall and remove from superview
        [appWall dismiss];
        [self removeFromSuperview];
        
    }];
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
