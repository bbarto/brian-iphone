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


#import "SwipeDemoView.h"

#define Y_TOLERANCE 20
#define X_TOLERANCE 100

@implementation SwipeDemoView


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	int noTouchesInEvent  = ((NSSet*)[event allTouches]).count;
	int noTouchesBegan	  = touches.count;
	NSLog(@"began %i, total %i", noTouchesBegan, noTouchesInEvent);
	if((state == S0) && (noTouchesBegan== 1) && (noTouchesInEvent==1)){
		startLocation  = [(UITouch*)[touches anyObject] locationInView:self];
		startTime	   = [(UITouch*)[touches anyObject] timestamp];
		state = S1;
	}
	else{
		state = S0;
		[self setNeedsDisplay];
	}
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	int noTouchesInEvent  = ((NSSet*)[event allTouches]).count;
	int noTouchesEnded	  = touches.count;
	NSLog(@"ended %i %i", touches.count, ((NSSet*)[event allTouches]).count);
	if( (state==S1) && (noTouchesEnded == 1) && (noTouchesInEvent==1)){
		endLocation = [(UITouch*)[touches anyObject] locationInView:self];
		endTime		= [(UITouch*)[touches anyObject] timestamp];
		[self setNeedsDisplay];
	}
}



- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		state = S0;
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	NSString  *message;
	if(state==S0){
		[@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10,100) withFont:[UIFont systemFontOfSize:16]];
		[@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10,150) withFont:[UIFont systemFontOfSize:16]];
		[@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10,200) withFont:[UIFont systemFontOfSize:16]];
	}
	if(state == S1){
		message = 
		[NSString 
		 stringWithFormat:@"Started (%.0f, %.0f), ended (%.0f, %.0f)",
		 startLocation.x, startLocation.y, endLocation.x, endLocation.y
		 ];
		[message drawAtPoint:CGPointMake(10,100) withFont:[UIFont systemFontOfSize:16]];
		
		message = 
		[NSString 
		 stringWithFormat:@"Took %4.3f seconds", endTime-startTime
		 ];
		[message drawAtPoint:CGPointMake(10,150) withFont:[UIFont systemFontOfSize:16]];
		
		if( (fabs(startLocation.y - endLocation.y) <= Y_TOLERANCE)  &&
			(fabs(startLocation.x - endLocation.x) >= X_TOLERANCE)
			){
			char *direction;
			direction = (endLocation.x > startLocation.x) ? "right" : "left";
			message = 
			[NSString 
			 stringWithFormat:@"Perfect %s swipe, speed: %4.3f pts/s", direction, 
			 (endTime-startTime) > 0 ? fabs(endLocation.x - startLocation.x) /(endTime-startTime) : 0
			 ];
			[message drawAtPoint:CGPointMake(10,200) withFont:[UIFont systemFontOfSize:16]];
		}
		else{
			[@"\t\t\t\t\t\t\t\t\t\t" drawAtPoint:CGPointMake(10,200) withFont:[UIFont systemFontOfSize:16]];
		}
		state = S0;
	}
}

@end
