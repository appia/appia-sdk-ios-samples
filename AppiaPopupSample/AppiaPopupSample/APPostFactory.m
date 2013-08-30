//
//  APPostFactory.m
//  AppiaPopupSample
//
//  Created by Brian Watkins on 8/28/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APPostFactory.h"
#import "APPost.h"
#import "APComment.h"

@interface APPostFactory ()

@property (nonatomic,strong) NSString *postFilePath;

@end

@implementation APPostFactory

- (id)initWithPostFile:(NSString *)path
{
    if ((self = [super init]))
    {
        [self setPostFilePath:path];
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
    
    NSMutableArray *posts = [[NSMutableArray alloc] initWithCapacity:[postProperties count]];
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
