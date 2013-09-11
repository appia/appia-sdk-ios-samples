//
//  APDrawerAppWallView.m
//  AppiaEmbeddedSample
//
//  Created by Brian Watkins on 9/10/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APDrawerAppWallView.h"
#import <QuartzCore/QuartzCore.h>
#import <AppiaSDK/Appia.h>

@interface APDrawerAppWallView ()
{
    AIAppWall *appWall;
    CGPoint dragPoint;
    CGFloat handleHeight, openYPosition, closedYPosition;
    BOOL isClosed;
    UIImageView *arrowView;
}

@end

@implementation APDrawerAppWallView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        appWall = [[AIAppia sharedInstance] createAppWall];
        
        handleHeight = 47.0;
                
        //a view for the 'handle' to the drawer
        UIImageView *handleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bar.png"]];
        [handleView setUserInteractionEnabled:YES];
        [self addSubview:handleView];
        
        //an arrow indicator
        arrowView = [[UIImageView alloc] initWithFrame:CGRectMake(260.0, 5.0, 36.0, 11.0)];
        [arrowView setImage:[UIImage imageNamed:@"arrow.png"]];
        [handleView addSubview:arrowView];
        
        //label for more apps
        UILabel *appsLabel = [[UILabel alloc] initWithFrame:CGRectMake(243.0, 10.0, 70.0, 25.0)];
        //UILabel *appsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 23.0, 320.0, 25.0)];
        [appsLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:9.0]];
        [appsLabel setTextColor:[UIColor colorWithWhite:0.75 alpha:1.0]];
        [appsLabel setTextAlignment:NSTextAlignmentCenter];
        [appsLabel setBackgroundColor:[UIColor clearColor]];
        [appsLabel setText:@"More Apps"];
        [handleView addSubview:appsLabel];
        
        //a gesture recognizer to handle the dragging
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [handleView addGestureRecognizer:pan];
        
        //a view to contain the AppWall
        UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(0.0,
                                                                  handleView.frame.size.height,
                                                                  self.frame.size.width,
                                                                  self.frame.size.height - handleView.frame.size.height)];
        [adView.layer setBorderWidth:2.0];
        [adView.layer setBorderColor:[[UIColor colorWithRed:65.0/255.0 green:65.0/255.0 blue:65.0/255.0 alpha:1.0] CGColor]];
        [adView setBackgroundColor:[UIColor darkGrayColor]];
        [self addSubview:adView];
        
        [appWall presentInView:adView];
        
        UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0.0, self.frame.size.height, self.frame.size.width, 300.0)];
        [bg setBackgroundColor:[UIColor colorWithRed:65.0/255.0 green:65.0/255.0 blue:65.0/255.0 alpha:1.0]];
        [self addSubview:bg];
        
        isClosed = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    openYPosition = self.superview.frame.size.height - (self.frame.size.height / 2.0);
    closedYPosition = self.superview.frame.size.height + (self.frame.size.height / 2.0) - handleHeight;
}

- (void)handlePan:(UIPanGestureRecognizer *)gr
{
    switch ([gr state])
    {
        case UIGestureRecognizerStateBegan:
        {
            dragPoint = [self.layer position];
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            //change my vertical position
            CGPoint delta = [gr translationInView:self];
            
            //CGFloat newY = MIN(MAX(dragPoint.y + delta.y, openYPosition), closedYPosition);
            CGFloat newY = MIN(dragPoint.y + delta.y, closedYPosition);
            
            if (newY < openYPosition)
            {
                newY = openYPosition - powf(openYPosition - newY, 0.75);
            }
            
            [self.layer setPosition:CGPointMake(dragPoint.x, newY)];

            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            //scroll to the finish
            CGFloat finalY;
            if (isClosed)
            {
                //scroll open
                finalY = openYPosition;
            }
            else
            {
                finalY = closedYPosition;
                
            }
            
            isClosed = !isClosed;
            
            [UIView animateWithDuration:0.5 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:^{
                
                [self.layer setPosition:CGPointMake(self.layer.position.x, finalY)];
                
            } completion:^(BOOL finished) {
                
                //reset the arrow graphic
                NSString *arrowImageSrc = isClosed ? @"arrow.png" : @"arrow_down.png";
                [arrowView setImage:[UIImage imageNamed:arrowImageSrc]];
                
            }];
            
            break;
        }
        default:
        {
            break;
        }
            
    }
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
