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

#import "AnimView.h"
#import <QuartzCore/QuartzCore.h>

@implementation AnimView


- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		childView = [[UIView alloc] initWithFrame:CGRectMake(100, 150, 100, 150)];
		childView.backgroundColor = [UIColor whiteColor];
		[self addSubview:childView];
	}
	return self;
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	
#if 1
	// subsection 1
	if( [(UITouch*)[touches anyObject] tapCount] == 2){
		UITouch	*touch = [touches anyObject];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[UIView setAnimationDuration:1];
		childView.center = [touch locationInView:self];
		[UIView commitAnimations];
	}	
	
#else	
	// subsection 2.
	if( [(UITouch*)[touches anyObject] tapCount] == 2){
		childView.backgroundColor = [UIColor blueColor];
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[UIView setAnimationDuration:0.5];
		[UIView setAnimationDelegate:self];
		childView.transform = CGAffineTransformMakeScale(1.5, 1.5);
		[UIView commitAnimations];
	}
#endif
}

// subsection 2
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag {
	childView.transform = CGAffineTransformIdentity;
	childView.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
	[childView release];
	[super dealloc];
}


@end
