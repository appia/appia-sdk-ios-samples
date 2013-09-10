//
//  APComment.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APComment.h"

@implementation APComment

- (CGFloat)heightForComment
{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:13.0];
    CGSize commentTextSize = [self.text sizeWithFont:font constrainedToSize:CGSizeMake(290.0, CGFLOAT_MAX)];
    
    return 42.0 + commentTextSize.height;
}

- (UIImage *)pictureImage
{
    return [UIImage imageNamed:self.picture];
}

@end
