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

#import "MyWebViewController.h"


@implementation MyWebViewController

- (void)loadView {
	CGRect	rectFrame = [UIScreen mainScreen].applicationFrame;
	UIView  *view = [[UIView alloc] initWithFrame:rectFrame];
	view.autoresizingMask = UIViewAutoresizingFlexibleHeight|
	UIViewAutoresizingFlexibleWidth;	
	webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	webView.scalesPageToFit = YES;
	
	NSMutableString *htmlContents = [[NSMutableString alloc] initWithCapacity:100]; ;
	[htmlContents appendString:
	 @"<meta name=\"viewport\" content=\"width=320\"/>"
	 "<html>"
	 "<body>"
	 ];
	[htmlContents appendString:@"<H2>Hurley</H2>"];
	[htmlContents appendString:[self produceImageReference:@"hurley" withType:@"jpg"]];
	[htmlContents appendString:@"<H1>Hugo</H1>"];
	[htmlContents appendString:[self produceImageReference:@"hurley" withType:@"jpg"]];
	[htmlContents appendString:@"<H3>Jorge Garcia</H3>"];
	[htmlContents appendString:[self produceImageReference:@"hurley" withType:@"jpg"]];
	[htmlContents appendString:@
	 "</body>"
	 "</html>"];
	
	[webView loadHTMLString:htmlContents baseURL:nil];
	[view addSubview:webView];
	self.view = view;
	[view release];
	[htmlContents release];
}

-(NSString*) produceImageReference:(NSString*) imgFileName withType:(NSString*) imgType{
	NSMutableString *returnString = [[[NSMutableString alloc] initWithCapacity:100] autorelease];
	NSString *filePath = [[NSBundle mainBundle] pathForResource:imgFileName ofType:imgType];  
	if(filePath){
		[returnString appendString:@"<IMG SRC=\"file://"];
		[returnString appendString:filePath];
		[returnString appendString:@"\" ALT=\""];
		[returnString appendString:imgFileName];
		[returnString appendString:@"\">"];
		return returnString;
	}
	else return @"";
}
- (void)dealloc {
	[webView release];
	[super dealloc];
}
@end
