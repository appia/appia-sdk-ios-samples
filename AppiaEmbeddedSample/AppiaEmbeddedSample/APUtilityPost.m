//
//  APUtilityPost.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 9/6/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APUtilityPost.h"

@implementation APUtilityPost

- (id)init
{
    if ((self = [super init]))
    {
        [self setType:APPostTypeUtility];
    }
    
    return self;
}

- (CGFloat)heightForPost
{
    return 75.0;
}

@end
