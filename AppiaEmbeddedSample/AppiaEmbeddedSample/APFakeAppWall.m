//
//  APFakeAppWall.m
//  AppiaEmbeddedSample
//
//  Created by Brian Watkins on 9/12/13.
//  Copyright (c) 2013 Appia, Inc. All rights reserved.
//

#import "APFakeAppWall.h"
#import <QuartzCore/QuartzCore.h>

@interface APFakeAppWall ()
{
    UIWebView *webView;
}

@end

@implementation APFakeAppWall

- (id)init
{
    if ((self = [super init]))
    {
    }
    
    return self;
}

- (void)presentInView:(UIView *)view
{
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0.0, view.frame.size.width, view.frame.size.height)];
    //webView.delegate = self;
    webView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [webView.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [webView.layer setBorderWidth: 2.0];
    
    //load the fake html
    NSString *fakeAppWallPath = [[NSBundle mainBundle] pathForResource:@"fake_appwall" ofType:@"html"];
    NSData *fakeAppWallData = [NSData dataWithContentsOfFile:fakeAppWallPath];
    [webView loadData:fakeAppWallData MIMEType:@"text/html" textEncodingName:@"utf-8" baseURL:nil];
    
    [view addSubview:webView];
}

- (void)dismiss
{
    [webView removeFromSuperview];
    webView = nil;
}

@end
