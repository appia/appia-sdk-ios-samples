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
        
        handleHeight = 30.0;
                
        //a view for the 'handle' to the drawer
        UIView *handleView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, handleHeight + 5.0)];
        [handleView setBackgroundColor:[UIColor darkGrayColor]];
        [handleView.layer setCornerRadius:5.0];
        [handleView.layer setMasksToBounds:YES];
        [self addSubview:handleView];
        
        //a gesture recognizer to handle the dragging
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [handleView addGestureRecognizer:pan];
        
        //a view to contain the AppWall
        UIView *adView = [[UIView alloc] initWithFrame:CGRectMake(0.0,
                                                                  handleView.frame.size.height - 5.0,
                                                                  self.frame.size.width,
                                                                  self.frame.size.height - handleView.frame.size.height + 5.0)];
        [adView setBackgroundColor:[UIColor darkGrayColor]];
        [self addSubview:adView];
        
        [appWall presentInView:adView];
        
        isClosed = YES;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"Laying out subviews: %f", self.superview.frame.size.height);
        
    openYPosition = self.superview.frame.size.height - (self.frame.size.height / 2.0);
    closedYPosition = self.superview.frame.size.height + (self.frame.size.height / 2.0) - handleHeight;
    
    NSLog(@"open: %f; closed: %f", openYPosition, closedYPosition);
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
            
            CGFloat newY = MIN(MAX(dragPoint.y + delta.y, openYPosition), closedYPosition);
                        
            [self.layer setPosition:CGPointMake(dragPoint.x, newY)];

            break;
        }
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        {
            NSLog(@"Gesture cancelled");
            
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
                
            } completion:NULL];
            
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
