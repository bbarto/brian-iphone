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

#import	<QuartzCore/QuartzCore.h>

#import "AnimationApp2AppDelegate.h"
#import "AnimView.h"

@implementation AnimationApp2AppDelegate



- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	
	window = [[UIWindow alloc] initWithFrame:[[UIScreen  mainScreen] bounds]];
	CGRect	frame = [UIScreen mainScreen].applicationFrame;
	view1 = [[AnimView alloc] initWithFrame:frame];
	view1.message = @"View 1";
	view1.backgroundColor =[UIColor whiteColor];
	[window	addSubview:view1];
	view2 = [[AnimView alloc] initWithFrame:frame];
	view2.message = @"View 2";
	view2.backgroundColor =[UIColor yellowColor];
    [window makeKeyAndVisible];
}

-(void)showOtherView:(UIView*) oldView{
	if(oldView == view1){
		[view1	removeFromSuperview];
		[window addSubview:view2];
	}
	else{
		[view2	removeFromSuperview];
		[window addSubview:view1];
	}
	CATransition *animation = [CATransition animation];
	[animation setType:kCATransitionMoveIn];
	[animation setSubtype:kCATransitionFromRight];
	[animation setDuration:0.5];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
	[[window layer] addAnimation:animation forKey:@"mykey"];		
}

- (void)dealloc {
	[view1	release];
	[view2	release];
	[window release];
	[super dealloc];
}


@end
