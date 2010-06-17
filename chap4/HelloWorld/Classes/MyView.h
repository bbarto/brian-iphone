//
//  MyView.h
//  HelloWorld
//
//  Created by Brian Barto on 5/25/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//
#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface MyView : UIView {
	HelloWorldViewController *myController;
}
@property(nonatomic, retain) HelloWorldViewController* myController;

@end
