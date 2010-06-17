    //
//  MyView.m
//  HelloWorld
//
//  Created by Brian Barto on 5/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"


@implementation MyView
@synthesize myController;


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	// Storing the location of th ebeginning of the touch
	//myController.startLocation = [(UITouch*)[touches anyObject] locationInView:self];
}

- (void)touchesEnded: (NSSet *)touches withEvent:(UIEvent *)event{
	// Stroing the location of the end of the touch
	//myController.endLocation = [(UITouch*)[touches anyObject] locationInView:self];
	
	// Determining if swipe
	//if ([myController endLocation].x > [myController startLocation].x) {
	//	[myController setMessage:@"Right Swipe"];
	//} else if (endLocation.x < startLocation.x) {
	//	myController.message = @"Left Swipe!!";
	//} else {
		if ( [(UITouch*)[touches anyObject] tapCount] >= 2) {
			[myController setMessage:@"Double Tapped"];
		} else {
			[myController setMessage:@"Tapped"];
		}
	//}
	// This actually redraws the view (with changed message)
	[self setNeedsDisplay];
}


 
- (void)drawRect:(CGRect)rect{
	[[myController message] drawAtPoint:CGPointMake(30,70) withFont:[UIFont systemFontOfSize:32]];
}

@end
