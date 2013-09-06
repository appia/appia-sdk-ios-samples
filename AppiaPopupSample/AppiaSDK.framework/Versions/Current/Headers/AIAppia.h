//
//  AIAppia.h
//  AppiaSDK
//
//  Created by Otto Hammersmith on 2/25/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#define APPIA_ENV_DEV 1
#define APPIA_ENV_QA 2

@class AIUserDataObject;
@class AIAppWall;
@class AIBannerAd;
#import "AIConstants.h"

@interface AIAppia : NSObject <NSURLConnectionDelegate>

+ (id)sharedInstance;

@property (nonatomic, retain) NSString *siteId;
@property (nonatomic, readonly) BOOL udidOptOutFlag;  // opt in is the default

-(void) startSession;
-(void) endSession;
-(NSInteger) launchCount;
-(void) udidOptIn;  // opt in is the default
-(void) udidOptOut;
-(void) sendUserData:(AIUserDataObject *)data;


//request that an app wall be cached
- (void)cacheAppWall;

//create ad objects
- (AIAppWall *)createAppWall;
- (AIBannerAd *)createBannerAdWithSize:(AIBannerAdSize)size;
- (AIBannerAd *)createBannerAd;

// TODO support for generated ids < iOS 6 will change this back to NSUUID
+(NSString*) advertisingIdentifier;


@end
