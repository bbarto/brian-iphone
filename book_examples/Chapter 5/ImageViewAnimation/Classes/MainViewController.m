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


-(void)hideView{
  UIView  *_aView = [self.view viewWithTag:5555];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.75f];
  _aView.frame = CGRectMake(160, 240, 0, 0);
  [UIView commitAnimations];  
}

-(void)showView{
  UIView  *_aView = [self.view viewWithTag:5555];
  [UIView beginAnimations:nil context:nil];
  [UIView setAnimationDuration:0.75f];
  _aView.frame = CGRectMake(0, 80, 320, 250);
  [UIView commitAnimations];  
}

- (void)loadView {
  self.view = [[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)] autorelease];
  self.view.backgroundColor = [UIColor grayColor];
  
  UIImageView *imageView = [[[UIImageView alloc] initWithFrame:CGRectZero] autorelease];
  imageView.image = [UIImage imageNamed:@"sample.jpg"];
  imageView.tag = 5555;
  imageView.center = CGPointMake(160, 240);
  [self.view addSubview:imageView];
  
  UIButton  *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"Push" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(buttonPushed) forControlEvents:UIControlEventTouchUpInside];
  button.frame = CGRectMake(115, 440, 80, 40);
  [self.view addSubview:button];
}

-(void)buttonPushed{
   UIView  *_aView = [self.view viewWithTag:5555];
  if(_aView.frame.size.height == 0){
    [self showView];
  }
  else{
    [self hideView];
  }
}

@end

