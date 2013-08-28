//
//  APPostFactory.h
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPostFactory : NSObject

- (id)initWithPostFile:(NSString *)path;

- (NSArray *)posts;

@end
