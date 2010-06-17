    //
//  HelloWorldViewController.m
//  HelloWorld
//
//  Created by Brian Barto on 5/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HelloWorldViewController.h"
#import "MyView.h"



@implementation HelloWorldViewController
@synthesize message;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        //strTapped = @"Tapped";
		//strDoubleTapped = @"Double Tapped";
		//strLeftSwipe = @"Left Swipe";
		//strRightSwipe = @"Right Swipe";
		//strPortraitNormal = @"Portrait";
		//strPortraitUpSideDown = @"Portrait UpSideDown";
		//strLandscape = @"Landscape";
		message = @"Started";
    }
    return self;
}


- (void)loadView {
	// Create our views here and assigns them to self
	
	CGRect frame = CGRectMake(0,0,320,480);
	MyView *theView = [[MyView alloc] initWithFrame:frame];
	theView.backgroundColor = [UIColor whiteColor];
	theView.myController = self;
	theView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	self.view = theView;
	[theView autorelease];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	
	switch (interfaceOrientation) {
		case UIInterfaceOrientationPortrait:
			message = @"Portrait";
			break;
		case UIInterfaceOrientationPortraitUpsideDown:
			message = @"Portrait Upside Down";
			break;
		case UIInterfaceOrientationLandscapeLeft:
			message = @"Landscape Left";
			break;
		case UIInterfaceOrientationLandscapeRight:
			message = @"Landscape Right";
			break;
	}
	
	// Return YES for supported orientations
    return YES;
}

@end
