//
//  AIAdParameters.h
//  AppiaSDK
//
//  Created by Brian Watkins on 10/7/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIAdParameters : NSObject

- (void)setAppiaParameters:(NSDictionary *)params;
- (NSDictionary *)appiaParameters;

- (void)setUserParameters:(NSDictionary *)params;
- (NSDictionary *)userParameters;

@end
