//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Lukas Prusha on 13-07-02.
//  Copyright (c) 2013 U-Vic. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HelloWorldViewController;

@interface HelloWorldAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) HelloWorldViewController *viewController;

@end
