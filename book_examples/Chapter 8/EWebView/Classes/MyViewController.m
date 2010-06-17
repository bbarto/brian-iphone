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
	CGRect	rectFrame = [UIScreen mainScreen].applicationFrame;
	UIView  *view = [[UIView alloc] initWithFrame:rectFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|
	UIViewAutoresizingFlexibleWidth;	
	webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	webView.scalesPageToFit = YES;
	webView.delegate = self;
	[webView  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.google.com"]]];
	[view addSubview:webView];
	self.view = view;
	[view release];
}


- (void)dealloc {
	[webView release];
	[super dealloc];
}

- (BOOL)webView:(UIWebView *)webView 
shouldStartLoadWithRequest:(NSURLRequest *)request 
 navigationType:(UIWebViewNavigationType)navigationType{
	url = [[request URL] absoluteString];
	NSLog(url);
	if([url hasSuffix:@".pdf"] == YES){
		UIAlertView *alert =
		[[[UIAlertView alloc] initWithTitle:@"Do You Want To Also Save A Copy?" 
								   message:@"Download PDF file?" 
								  delegate:self 
						 cancelButtonTitle:@"No" 
						 otherButtonTitles:@"Download", nil] autorelease];
		[alert show];
	}
	return YES;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	if(buttonIndex == 1){ //download?
		NSLog(@"Downloading %@ ...", url);
	}
}

@end
