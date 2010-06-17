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

#import "PVViewController.h"

@implementation PVViewController

-(id)initWithStreetNames:(NSArray*) streets{
	if (self = [super init]) {	
		directions = [[NSMutableArray arrayWithObjects:
					   @"East",
					   @"West",
					   nil] retain];	
		streetNames = [streets copy];
	}
	return self;
}

- (id)init{
	return [self initWithStreetNames:[NSArray arrayWithObjects:@"Street Name", nil]];
}

- (void)loadView {
	
	//Create the main view
	UIView *theView   = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	theView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
	
	pickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
	CGSize pickerSize = [pickerView sizeThatFits:CGSizeZero];
	pickerView.frame = CGRectMake(0,0, pickerSize.width, pickerSize.height);
	pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	pickerView.delegate = self;
	pickerView.showsSelectionIndicator = YES;	
	
	[theView addSubview:pickerView];
	self.view = theView;
}




- (void)dealloc {
	[pickerView release];
	[directions release];
	[streetNames release];
	[super dealloc];
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
	NSString  *street, *direction;
	street =  [streetNames objectAtIndex:[pickerView selectedRowInComponent:0]];
	direction  =  [directions objectAtIndex:[pickerView selectedRowInComponent:1]];
	if(component ==0){
		if(  ([street isEqual:@"Coit Road"] == YES) ||
			 ([street isEqual:@"Preston Road"] == YES) ||
			 ([street isEqual:@"Independence"] == YES)){
			[directions removeAllObjects];
			[directions addObject:@"North"];
			[directions addObject:@"South"];
			[pickerView reloadComponent:1];			
		}
		else{
			[directions removeAllObjects];
			[directions addObject:@"East"];
			[directions addObject:@"West"];
			[pickerView reloadComponent:1];	
		}
		printf("Selected row in Component 0 is now %s. Selected row in Component 1 remains %s\n",  
			   [street cStringUsingEncoding:NSUTF8StringEncoding],
			   [direction cStringUsingEncoding:NSUTF8StringEncoding]);	
	}
	else{
		printf("Selected row in Component 1 is now %s. Selected row in Component 0 remains %s\n",   
			   [direction cStringUsingEncoding:NSUTF8StringEncoding],
			   [street cStringUsingEncoding:NSUTF8StringEncoding]);	
	}
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	if (component == 0)
	{
		return [streetNames objectAtIndex:row];
	}
	else
	{
		return [directions objectAtIndex:row];
	}
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	if (component == 0)
		return 200.0;	
	else
		return 100.0;	
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return 40.0;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	if (component == 0){
		return [streetNames count];
	}
	else
	{
		return [directions count];
	}
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 2;
}


@end
