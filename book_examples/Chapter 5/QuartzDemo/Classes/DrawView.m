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

#import "DrawView.h"
#import <math.h>

@implementation DrawView


- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		// Initialization code
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef	context = UIGraphicsGetCurrentContext();
	
	CGContextSetLineWidth(context, 5.0);
	CGContextMoveToPoint(context, 50, 100);
	CGContextAddLineToPoint(context, 200, 100);
	CGContextStrokePath(context);
	

	CGContextAddEllipseInRect(context, CGRectMake(70.0, 170.0, 50.0, 50.0));
	CGContextStrokePath(context);
	
	
	CGContextAddEllipseInRect(context, CGRectMake(150.0, 170.0, 50.0, 50.0));
	CGContextFillPath(context);
	
	
	CGContextSetRGBStrokeColor(context, 0.0, 1.0, 0.0, 1.0);
	CGContextSetRGBFillColor(context, 0.0, 0.0, 1.0, 1.0);
	CGContextAddRect(context, CGRectMake(30.0, 30.0, 60.0, 60.0));
	CGContextFillPath(context);
	
	
	CGContextAddArc(context, 260, 90, 40, 0.0*M_PI/180, 270*M_PI/180, 1);
	CGContextAddLineToPoint(context, 280, 350);
	CGContextStrokePath(context);
	
	CGContextMoveToPoint(context, 130, 300);
	CGContextAddLineToPoint(context, 80, 400);
	CGContextAddLineToPoint(context, 190, 400);
	CGContextAddLineToPoint(context, 130, 300);
	CGContextStrokePath(context);
	
}


- (void)dealloc {
	[super dealloc];
}


@end
