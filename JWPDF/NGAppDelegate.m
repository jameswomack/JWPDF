//
//  NGAppDelegate.m
//  JWPDF
//
//  Created by James Womack on 3/27/13.
//  Copyright (c) 2013 Noble Gesture. All rights reserved.
//

#import "NGAppDelegate.h"
#import "JWPDF.h"

@implementation NGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIViewController *viewController = UIViewController.new;
    viewController.view = [UIView.alloc initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    CGPDFDocumentRef exampleRef = [JWPDF documentWithName:@"example"];
    
    [JWPDF logTitleOfDocument:exampleRef];
    
    return YES;
}

@end
