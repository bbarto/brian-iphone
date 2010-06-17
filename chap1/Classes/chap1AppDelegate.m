//
//  chap1AppDelegate.m
//  chap1
//
//  Created by Brian Barto on 5/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "chap1AppDelegate.h"

@implementation chap1AppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return YES;
}

-(IBAction)buttonTapped{
	UILabel *label = (UILabel*) [window viewWithTag:55];
	if ([label.text isEqualToString:@"Hello iPhone!"])
		label.text = @"Hello World";
	else {
		label.text = @"Hello iPhone!";
	}
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
