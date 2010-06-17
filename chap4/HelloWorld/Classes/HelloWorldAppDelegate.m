//
//  HelloWorldAppDelegate.m
//  HelloWorld
//
//  Created by Brian Barto on 5/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "HelloWorldAppDelegate.h"
#import "HelloWorldViewController.h"

@implementation HelloWorldAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
	// Chap 5 - hiding the status bar
	[UIApplication sharedApplication].statusBarHidden = YES;
	
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]];
	viewController = [[HelloWorldViewController alloc] initWithNibName:nil bundle:nil];
	[window addSubview:viewController.view];
	
	//CGRect		frame = [UIScreen mainScreen].applicationFrame;
	
	//CGRect frame = CGRectMake(0,0,320,150);
	//view = [[MyView alloc] initWithFrame:frame];
	//view.message = @"Hello World!";
	//view.backgroundColor = [UIColor whiteColor];	
	//[window	addSubview:view];
	
	//CGRect frametwo = CGRectMake(0,155,320,150);
	///viewtwo = [[MyView alloc] initWithFrame:frametwo];
	//viewtwo.multipleTouchEnabled = YES;
	//viewtwo.message = @"Goodbye World!";
	//viewtwo.backgroundColor = [UIColor whiteColor];	
	//[window	addSubview:viewtwo];
	
	
	[window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
	[viewController release];
    [super dealloc];
}


@end
