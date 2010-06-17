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


#import "DWebViewAppDelegate.h"
#import "Person.h"

@implementation DWebViewAppDelegate

@synthesize window;

-(void)loadData{
	Person *a, *b;
	a = [[Person alloc] autorelease];
	a.name = @"John Doe";
	a.address = @"1234 Fake st";
	a.phone = @"(555) 555-1234";
	b = [[Person alloc] autorelease];
	b.name = @"Jane Doe";
	b.address = @"4321 Fake st";
	b.phone = @"(555) 555-7898";
	records = [NSArray arrayWithObjects:a, b, nil];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {	
	[self loadData];
	CGRect	rectFrame = [UIScreen mainScreen].applicationFrame;
	window = [[UIWindow alloc] initWithFrame:rectFrame];
	UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	webView.scalesPageToFit = YES;
	
	NSMutableString *html = [[NSMutableString alloc] initWithCapacity:200];
	[html appendString:
	 @"<html>"
	 " <meta name=\"viewport\" content=\"width=320\"/>"
	 " <body>"	 
	 " <h4>"
	 " Records Found:"
	 " </h4>"	 
	 " <table border=\"6\">"
	 " <caption>Database</caption>"
	 " <tr>"
	 " <td>Name</td>"
	 " <td>Address</td>"
	 " <td>Phone</td>"
	 " </tr>"];
	[html appendString:[self allRecordsInHTML]];
	[html appendString:
	 @"</table>"	
	 " </body>"
	 " </html>"
	 ];
	[webView loadHTMLString:html baseURL:nil];
	[window addSubview:webView];
	[webView release];
	[html release];
  [window makeKeyAndVisible];
}

-(NSString*) allRecordsInHTML{
	NSMutableString *myRecords = [[[NSMutableString alloc] initWithCapacity:200] autorelease];
	for (Person *p in records) {
		[myRecords appendString:[p html]];
	}
	return myRecords;
	
}

- (void)dealloc {
	[window release];
	[super dealloc];
}
@end
