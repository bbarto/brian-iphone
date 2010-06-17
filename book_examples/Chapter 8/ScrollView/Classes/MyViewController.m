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
#import "MyViewController.h"

@implementation MyViewController


- (void)loadView {
  UIImageView *imgView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"picture.jpg"]] autorelease];
  imgView.tag = 100;
  
  UIScrollView *scrollView = [[[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,480)] autorelease];
	scrollView.delegate = self;
	scrollView.minimumZoomScale = 0.25;
	scrollView.maximumZoomScale = 2;
	scrollView.bounces = NO;
	scrollView.showsHorizontalScrollIndicator = NO;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.contentSize = imgView.frame.size;
	scrollView.contentOffset = CGPointMake((imgView.frame.size.width-320)/2,(imgView.frame.size.height-480)/2);
	[scrollView addSubview:imgView];
  self.view = scrollView;
}

-(void)viewDidAppear:(BOOL)animated{
 // [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(myTimer:) userInfo:nil repeats:NO];
}

-(void)myTimer:(NSTimer*)timer{
  [(UIScrollView*)self.view scrollRectToVisible:CGRectMake(400, 500, 320, 200) animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
  return [self.view viewWithTag:100];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
  NSLog(@"Content Offset = (%.2f, %.2f)", scrollView.contentOffset.x, scrollView.contentOffset.y);
}
@end

