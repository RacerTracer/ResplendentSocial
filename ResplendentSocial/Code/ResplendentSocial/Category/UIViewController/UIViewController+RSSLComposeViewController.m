//
//  UIViewController+RSSLComposeViewController.m
//  ResplendentSocial
//
//  Created by Benjamin Maer on 4/6/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import "UIViewController+RSSLComposeViewController.h"





@implementation UIViewController (RSSLComposeViewController)

+(SLComposeViewController*)RSSLComposeViewControllerForServiceType:(NSString *)serviceType initialText:(NSString*)initialText urls:(NSArray*)urls images:(NSArray*)images
{
	if ([self RSSLComposeViewControllerIsAvailable] == FALSE)
	{
		NSAssert(FALSE, @"Should check for RSSLComposeViewControllerIsAvailable before trying to use this method");
		return nil;
	}

    if ([SLComposeViewController isAvailableForServiceType:serviceType])
    {
        SLComposeViewController* composeViewController = [SLComposeViewController composeViewControllerForServiceType:serviceType];
        
        [composeViewController setInitialText:initialText];
        
        for (UIImage* image in images)
        {
            [composeViewController addImage:image];
        }
        
        for (NSURL* url in urls)
        {
            [composeViewController addURL:url];
        }
        
        SLComposeViewControllerCompletionHandler completionHandler = ^(SLComposeViewControllerResult result){
            [composeViewController dismissViewControllerAnimated:YES completion:nil];
        };
        
        [composeViewController setCompletionHandler:completionHandler];
        return composeViewController;
    }
    else
    {
        return nil;
    }
}

+(BOOL)RSSLComposeViewControllerIsAvailable
{
	static BOOL SLComposeViewControllerIsAvailable;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		SLComposeViewControllerIsAvailable = (NSClassFromString(@"SLComposeViewController") != nil);
	});

	return SLComposeViewControllerIsAvailable;
}

@end
