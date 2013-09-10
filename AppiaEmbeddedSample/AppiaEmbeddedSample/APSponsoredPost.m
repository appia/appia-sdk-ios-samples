//
//  APSponsoredPost.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 9/6/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APSponsoredPost.h"

@implementation APSponsoredPost

- (id)init
{
    if ((self = [super init]))
    {
        [self setType:APPostTypeSponsored];
    }
    
    return self;
}

- (CGFloat)heightForPost
{
    return 102.0 + 58.0;
}

@end
