//
//  UIViewController+RSSLComposeViewController.h
//  ResplendentSocial
//
//  Created by Benjamin Maer on 4/6/14.
//  Copyright (c) 2014 Resplendent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>





@interface UIViewController (RSSLComposeViewController)

+(SLComposeViewController*)RSSLComposeViewControllerForServiceType:(NSString *)serviceType initialText:(NSString*)initialText urls:(NSArray*)urls images:(NSArray*)images;

+(BOOL)RSSLComposeViewControllerIsAvailable;

@end
