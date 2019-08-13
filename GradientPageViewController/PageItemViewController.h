//
//  PageItemViewController.h
//  animationdemo
//
//  Created by fluxtech_macmini1 on 04/12/18.
//  Copyright © 2018 fluxtech_macmini1. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GradientPageViewController-Swift.h"

#import <Lottie/Lottie.h>
@interface PageItemViewController : UIViewController
@property (nonatomic) NSUInteger itemIndex;
@property (strong, nonatomic) UIColor *mytopcolor;
@property (strong, nonatomic) UIColor *mybottomcolor;
@property (weak, nonatomic) IBOutlet LOTAnimationView *lottieCircle;
@property (weak, nonatomic) IBOutlet LOTAnimationView *lottieoutsidecircle;
@property (weak, nonatomic) IBOutlet UIImageView *centerimage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *freeviplbl;
@property (weak, nonatomic) IBOutlet SpacingLabel *otherdesc;
@property (weak, nonatomic) IBOutlet UILabel *othertitle;
@property (weak, nonatomic) IBOutlet UILabel *freetriallbl;
@property (weak, nonatomic) IBOutlet UIView *scrollviewcontainer;
@property (weak, nonatomic) IBOutlet UIImageView *crownimageview;


@end
