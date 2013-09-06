//
//  APPostFactory.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostFactory.h"
#import "APPost.h"
#import "APSponsoredPost.h"
#import "APUtilityPost.h"
#import "APComment.h"

@interface APPostFactory ()

@property (nonatomic,strong) NSString *postFilePath;
@property (nonatomic,assign) NSInteger numberOfSponsoredPosts;

@end

@implementation APPostFactory

- (id)initWithPostFile:(NSString *)path andSponsoredPosts:(NSInteger)numberOfAds
{
    if ((self = [super init]))
    {
        [self setPostFilePath:path];
        [self setNumberOfSponsoredPosts:numberOfAds];
    }
    
    return self;
}

- (NSArray *)posts
{
    //read in the posts from the file and construct the objects
    
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:self.postFilePath];
    
    NSArray *postProperties = (NSArray *)[NSPropertyListSerialization propertyListFromData:plistXML
                                                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                                                                    format:&format
                                                                          errorDescription:&errorDesc];
    
    if (!postProperties)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }

    NSInteger totalPosts = [postProperties count] + self.numberOfSponsoredPosts;
    
    NSMutableArray *posts = [[NSMutableArray alloc] initWithCapacity:totalPosts];
    
    for (NSDictionary *properties in postProperties)
    {
        APPost *post = [[APPost alloc] init];
        [post setOwner:[properties objectForKey:@"owner"]];
        [post setPicture:[properties objectForKey:@"picture"]];
        [post setText:[properties objectForKey:@"text"]];
        [post setDate:[properties objectForKey:@"date"]];
        
        NSArray *comments = [self commentsFromProperties:[properties objectForKey:@"comments"]];
        
        [post setComments:comments];
        
        [post setPhotos:[properties objectForKey:@"photos"]];
        
        [posts addObject:post];
    }
    
    //insert the sponsored posts
    for ( int x = 0; x < self.numberOfSponsoredPosts; x++ )
    {
        APSponsoredPost *sponsoredPost = [[APSponsoredPost alloc] init];        
        [posts insertObject:sponsoredPost atIndex:(4 * x + 1)];
    }
    
    //add a post for 'Load more posts'
    APUtilityPost *loadMore = [[APUtilityPost alloc] init];
    [loadMore setText:@"Load More Posts!"];
    [posts addObject:loadMore];
    
    return posts;
}

- (NSArray *)commentsFromProperties:(NSArray *)properties
{
    NSMutableArray *comments = [[NSMutableArray alloc] initWithCapacity:[properties count]];
    
    for (NSDictionary *dict in properties)
    {
        APComment *comment = [[APComment alloc] init];
        [comment setText:[dict objectForKey:@"text"]];
        [comment setDate:[dict objectForKey:@"date"]];
        [comment setOwner:[dict objectForKey:@"owner"]];
        [comment setPicture:[dict objectForKey:@"picture"]];
        [comments addObject:comment];
    }
    
    return comments;
}

@end
