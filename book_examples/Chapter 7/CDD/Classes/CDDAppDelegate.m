/******************************************************************************
 * Copyright (c) 2009, Maher Ali <maher.ali@gmail.com>
 * iPhone SDK 3 Programming - Advanced Mobile Development for Apple iPhone and iPod touch
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 ******************************************************************************/

#import "CDDAppDelegate.h"
#import "CDDViewController.h"
#import "MyBarView.h"


#define NAV1 @"Nav Title 1"
#define NAV2 @"Nav Title 2"

@implementation CDDAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]];
	ctrl1 = [[CDDViewController alloc] initWithNibName:nil bundle:nil withRightButton:NO
                                      withLeftButton:NO]; 
	ctrl1.title = @"Controller 1";
	ctrl1.navigationItem.title = NAV1;
	ctrl1.navigationItem.prompt = @"The Prompt 1";
	/* setting the Edit/Done */
	ctrl1.navigationItem.rightBarButtonItem =  [ctrl1 editButtonItem];
	ctrl1.editing = NO;
	
	// add these two lines with the MyBarView class to demo the title view
	//MyBarView *titleView = [[[MyBarView alloc] initWithFrame:CGRectMake(0, 0, 150, 30)] autorelease];
	//ctrl1.navigationItem.titleView = titleView;
  
	
	
	/* THIS DOES NOT WORK!!!
	 add these two lines with the MyBarView class to demo the right view 
   MyBarView *titleView = [[[MyBarView alloc] initWithFrame:CGRectMake(0, 0, 150, 30)] autorelease];
   ctrl1.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleView];
   */
	
	
	
	navController = 
	[[UINavigationController alloc] initWithRootViewController:ctrl1]; 
	
	[window addSubview:navController.view];
  [window makeKeyAndVisible];
	
}


-(void)showNextLevel:(NSString*) level{
	if([level isEqualToString:NAV1]){
		ctrl2 = [[CDDViewController alloc] initWithNibName:nil bundle:nil 
                                       withRightButton:YES withLeftButton:NO]; 
		ctrl2.title = @"Controller 2";
		ctrl2.navigationItem.title = NAV2;
		ctrl2.navigationItem.prompt = @"The Prompt 2";
		[navController pushViewController:ctrl2 animated:YES];
	}
}


- (void)dealloc {
	[window release];
	[ctrl1 release];
	[ctrl2 release];
	[navController release];
	[super dealloc];
}


@end
