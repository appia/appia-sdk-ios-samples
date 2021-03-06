//
//  APPost.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPost.h"
#import "APComment.h"

@implementation APPost

- (id)init
{
    if ((self = [super init]))
    {
        [self setType:APPostTypeStandard];
    }
    
    return self;
}

- (CGFloat)heightForPost
{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0];
    CGSize postTextSize = [self.text boundingRectWithSize:CGSizeMake(290.0, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:[[NSStringDrawingContext alloc] init]].size;
    
    CGFloat photoHeight = ([self.photos count] > 0) ? 290.0 : 0.0;
    
    return 110.0 + postTextSize.height + photoHeight;
}

- (CGFloat)heightForPostWithComments
{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15.0];
    CGSize postTextSize = [self.text boundingRectWithSize:CGSizeMake(290.0, CGFLOAT_MAX)
                                                  options:NSStringDrawingUsesLineFragmentOrigin
                                               attributes:@{NSFontAttributeName:font}
                                                  context:[[NSStringDrawingContext alloc] init]].size;
    
    CGFloat commentsHeight = 0.0;
    for (APComment *comment in self.comments)
    {
        commentsHeight += [comment heightForComment];
    }
    
    if ([self.comments count] == 0)
    {
        commentsHeight += 30.0;
    }
    
    CGFloat photoHeight = ([self.photos count] > 0) ? 290.0 : 0.0;
    
    return 87.0 + postTextSize.height + commentsHeight + photoHeight;
}

- (UIImage *)pictureImage
{
    return [UIImage imageNamed:self.picture];
}

@end
