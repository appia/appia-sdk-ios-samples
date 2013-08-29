//
//  APComment.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/29/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APComment : NSObject

@property (nonatomic,strong) NSString *text;
@property (nonatomic,strong) NSString *owner;
@property (nonatomic,strong) NSString *date;

- (CGFloat)heightForComment;

@end
