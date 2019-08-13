//
//  AppDelegate.h
//  GradientPageViewController
//
//  Created by macmini1 on 13/08/19.
//  Copyright © 2019 macmini1. All rights reserved.
//

#import <UIKit/UIKit.h>
#define IS_IPHONE        (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 480.0)
#define IS_IPHONE_5      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define IS_IPHONE_6      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define IS_IPHONE_6PLUS  (IS_IPHONE && [[UIScreen mainScreen] nativeScale] == 3.0f)
#define IS_IPHONE_6_PLUS (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0)
#define IS_IPHONE_X      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0)
#define IS_IPHONE_X      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height >= 812.0)

#define IS_IPHONE_XS      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 812.0)
#define IS_IPHONE_X_MAX      (IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 896.0)
#define IS_RETINA        ([[UIScreen mainScreen] scale] >= 2.0) // 3.0 for iPhone X, 2.0 for others

#define IS_IPAD_DEVICE   [(NSString*)[UIDevice currentDevice].model hasPrefix:@"iPad"]
#define DELEGATE ((AppDelegate*)[[UIApplication sharedApplication]delegate])
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

