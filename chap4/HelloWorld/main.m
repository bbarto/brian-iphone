//
//  main.m
//  HelloWorld
//
//  Created by Brian Barto on 5/25/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"HelloWorldAppDelegate");
    [pool release];
    return retVal;
}
