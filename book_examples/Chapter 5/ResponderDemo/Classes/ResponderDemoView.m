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

#import "ResponderDemoView.h"

#define MAX_ELAPSED_TIME  2

float distance(CGPoint a, CGPoint b){
	return sqrt( pow((a.x - b.x), 2) + pow((a.y - b.y), 2));
}


@implementation ResponderDemoView


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	int noTouchesInEvent  = ((NSSet*)[event allTouches]).count;
	int noTouchesBegan	  = touches.count;
	NSLog(@"began %i, total %i", noTouchesBegan, noTouchesInEvent);
	if((noTouchesBegan== 2) && (noTouchesInEvent==2)){
		NSArray *touchArray = [touches allObjects];
		state = S1;
		movedTogether = 1;
		movedSeperate = 0;
		accDistance = distance([[touchArray objectAtIndex:0] locationInView:self], 
							   [[touchArray objectAtIndex:1] locationInView:self]
							  );
	}
	else if((state!= S2) && ( (noTouchesBegan== 1) && (noTouchesInEvent==1))){
		state = S2; // S2 means we got the first touch
		UITouch *aTouch = (UITouch*)[touches anyObject];
		firstTouchTimeStamp = aTouch.timestamp;
		firstTouchLocInView = [aTouch locationInView:self];
	}
	else if((state == S2) && (noTouchesInEvent==2) ){
		UITouch *aTouch = (UITouch*)[touches anyObject];
		if((aTouch.timestamp - firstTouchTimeStamp) <= MAX_ELAPSED_TIME){
			state = S1;  // S1 means we got the second  touch within reasonable time
			movedTogether = 1;
			movedSeperate = 0;
			accDistance = distance([aTouch		locationInView:self], 
								   firstTouchLocInView
								   );
		}
		else {
			firstTouchTimeStamp = aTouch.timestamp;
			firstTouchLocInView = [aTouch locationInView:self];
		}
	}
	else state = S0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog(@"moved %i %i", touches.count, ((NSSet*)[event allTouches]).count);
	NSArray *allTouches = [touches allObjects];
	if((state == S1) && ([touches count] == 2) ){
		movedTogether++;
		accDistance += distance([[allTouches objectAtIndex:0] locationInView:self], 
								[[allTouches objectAtIndex:1] locationInView:self]
								);
	}
	else if((state == S1) && ([touches count] == 1) ){
		movedSeperate++;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	NSLog(@"ended %i %i", touches.count, ((NSSet*)[event allTouches]).count);
	if((state == S1) && ([touches count] == 2) ){
		NSLog(@"started together and ended together,"
			  "moved together %.0f%% of the time. AVG distance:%4.2f",
			  (movedSeperate+movedTogether) ? 100*(movedTogether/(movedTogether+movedSeperate)) : 100.0,
			  movedTogether ? accDistance/movedTogether : 0.0
		);
		[self setNeedsDisplay];
	}
	state = S0;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
	state = S0;
	movedTogether = movedSeperate = 0;
	accDistance =0;
}



- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		state = S0;
		movedTogether = movedSeperate = 0;
		accDistance =0;
	}
	return self;
}


- (void)drawRect:(CGRect)rect {
	NSString  *message = 
	[NSString 
		stringWithFormat:@"Moved together %.0f%% of the time.",
	 (movedSeperate+movedTogether) ? 100*(movedTogether/(movedTogether+movedSeperate)) : 100.0
	 ];
	[message drawAtPoint:CGPointMake(10,100) withFont:[UIFont systemFontOfSize:16]];
	
	message = 
	[NSString 
	 stringWithFormat:@"Average distance:%4.2f.", movedTogether ? accDistance/movedTogether : 0.0
	 ];
	[message drawAtPoint:CGPointMake(10,150) withFont:[UIFont systemFontOfSize:16]];
}
	

- (void)dealloc {
	[super dealloc];
}


@end
