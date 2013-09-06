//
//  APPost.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPost : NSObject

typedef enum
{
    APPostTypeStandard,
    APPostTypeSponsored,
    APPostTypeUtility
} APPostType;

@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *picture;
@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSArray *comments;
@property (nonatomic,strong) NSArray *photos;
@property (nonatomic,assign) APPostType type;

- (CGFloat)heightForPost;
- (CGFloat)heightForPostWithComments;

- (UIImage *)pictureImage;

@end
