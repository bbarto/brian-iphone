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
#import "MainViewController.h"

#define ANGLE 15.0

@implementation MainViewController

- (void)loadView {
  self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
  self.view.backgroundColor = [UIColor whiteColor];
  
  UIImageView  *imgView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow.png"]] autorelease];
  imgView.frame = CGRectMake(10, 100, 280, 280);
  imgView.tag = 1234;
  [self.view addSubview:imgView];
  
  UIButton  *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Rotate CW" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(rotateClockWise) forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(35, 430, 100, 40);
  [self.view addSubview:button];
  
  button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Rotate CCW" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(rotateCounterClockWise) forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(185, 430, 100, 40);
  [self.view addSubview:button];
  
  
}

-(void)rotate:(float)_angle{
  UIImageView *imgView = (UIImageView*)[self.view viewWithTag:1234];
  imgView.transform = CGAffineTransformConcat(imgView.transform, CGAffineTransformMakeRotation(_angle*(M_PI / 180)));
}

-(void)rotateClockWise{
  [self rotate:ANGLE];
}

-(void)rotateCounterClockWise{
  [self rotate:-ANGLE];
}

- (void)dealloc {
  [super dealloc];
}


@end

