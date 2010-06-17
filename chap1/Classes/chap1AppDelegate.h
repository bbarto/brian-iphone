//
//  chap1AppDelegate.h
//  chap1
//
//  Created by Brian Barto on 5/11/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface chap1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(IBAction)buttonTapped;

@end

