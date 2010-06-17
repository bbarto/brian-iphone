//
//  HelloWorldViewController.h
//  HelloWorld
//
//  Created by Brian Barto on 5/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HelloWorldViewController : UIViewController {
	NSString *message;
	CGPoint startLocation, endLocation;
}
@property(nonatomic, retain) NSString *message;

@end
