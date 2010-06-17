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

@implementation MainViewController

-(id)init{
  if(self = [super init]){
  }
  return self;
}

- (void)loadView {
  self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
  self.view.backgroundColor = [UIColor grayColor];
  UIButton  *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];

  [button setTitle:@"Right" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(40, 200, 80, 40);
  [self.view addSubview:button];
  
  button   = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Left" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(180, 200, 80, 40);
  [self.view addSubview:button];
  
}

-(void)right{
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:1.0];
  [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
  [UIView commitAnimations];
}

-(void)left{
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:1.0];
  [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
  [UIView commitAnimations];
}

@end

