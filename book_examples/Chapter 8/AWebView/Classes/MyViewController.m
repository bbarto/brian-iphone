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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		rightButton = 
		[[UIBarButtonItem alloc] 
		 initWithTitle:@"Process" 
		 style:UIBarButtonItemStyleDone
		 target:self 
		 action:@selector(processJavaScript)
		 ];
		self.navigationItem.rightBarButtonItem = rightButton; 
		[rightButton release];
	}
	return self;
}

-(void)processJavaScript{
	NSString* var = [webView stringByEvaluatingJavaScriptFromString:@"getQuery()"];
	if([var isEqualToString:@"dissent"] == YES){
		UIAlertView *alert = 
		[[UIAlertView alloc] 
		 initWithTitle:@"Forbidden!" 
		 message:@"Please enter a valid query."
		 delegate:nil 
		 cancelButtonTitle:@"OK" 
		 otherButtonTitles:nil
		 ];
		[alert show];
		[webView stringByEvaluatingJavaScriptFromString:@"clearQuery()"];
		return;
	}
	NSMutableString *query = [[NSMutableString alloc] initWithCapacity:200];
	[query appendString:@"document.getElementById('anchor').href=\"http://www.google.com/search?q="];
	[query appendString:var];
	[query appendString:@"\";"];
	
	NSMutableString *innerHTML = [[NSMutableString alloc] initWithCapacity:200];
	[innerHTML appendString:@"document.getElementById('anchor').innerHTML=\"Google "];
	[innerHTML appendString:var];
	[innerHTML appendString:@"\";"];
	
	[webView stringByEvaluatingJavaScriptFromString:@"loseFocusOfField()"];
	[webView stringByEvaluatingJavaScriptFromString:innerHTML];
	[webView stringByEvaluatingJavaScriptFromString:query];
	rightButton.enabled = NO;
	[query release];
	[innerHTML release];
}

- (void)loadView {
	CGRect	rectFrame = [UIScreen mainScreen].applicationFrame;
	UIView  *view = [[UIView alloc] initWithFrame:rectFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|
							UIViewAutoresizingFlexibleWidth;	
	webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	webView.scalesPageToFit = YES;
	[webView loadHTMLString:
	 @"<html><head><title>Query Assistant</title>\n"
	 "<meta name=\"viewport\" content=\"width=320\"/>"
	 "<script>"
	 "function getQuery(){return document.queryform.query.value;}"
	 "function clearQuery(){return document.queryform.query.value=\"\";}"
	 "function loseFocusOfField(){return document.queryform.query.blur();}" 
	 "</script>"
	 "</head><body>Please enter your query: <form name=\"queryform\">"
	 "<input name=\"Query\" type=\"text\" value=\"\" id=\"query\" />"
	 "<br/>"
	 "<br/>"
	 "<br/>"
	 "<a id=\"anchor\" href=\"\"></a>"
	 "</form></body></html>" baseURL:nil];
	[view addSubview:webView];
	self.view = view;
	[view release];
	
}

- (void)dealloc {
	[webView release];
	[rightButton release];
	[super dealloc];
}
@end
