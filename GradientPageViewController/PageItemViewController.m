//
//  PageItemViewController.m
//  animationdemo
//
//  Created by fluxtech_macmini1 on 04/12/18.
//  Copyright © 2018 fluxtech_macmini1. All rights reserved.
//

#import "PageItemViewController.h"
#import "UILabel+FormattedText.h"
@interface PageItemViewController (){
    NSArray *array;
    NSArray<NSString*> *titlearray;
    NSArray<NSString*> *descarray;
    NSArray<NSArray<NSString*>*> *diffcolorarray;


}

@property (nonatomic, strong) LOTAnimationView *lottiechekbox1;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel1;

@property (nonatomic, strong) LOTAnimationView *lottiechekbox2;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel2;


@property (nonatomic, strong) LOTAnimationView *lottiechekbox3;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel3;


@property (nonatomic, strong) LOTAnimationView *lottiechekbox4;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel4;

@property (nonatomic, strong) LOTAnimationView *lottiechekbox5;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel5;

@property (weak, nonatomic) IBOutlet UILabel *gradientlabel;

@property (weak, nonatomic) IBOutlet EPShinyButton *vipbtn;
@property (weak, nonatomic) IBOutlet EPShinyButton *mybtn;
@end

@implementation PageItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.crownimageview.transform = CGAffineTransformMakeRotation((-35.0f * M_PI) / 180.0f);

 array=@[@"10_followers",@"10_followers",@"profile_stalker",@"speed_up",@"no_followers_drop",@"customize"];
    titlearray=@[@"",@"10 Daily Bonus Followers",@"Profile Stalkers & Secret Admires",@"Followers Grow 300% Faster",@"No Followers Drop",@"Customize Followers"];
    descarray=@[@"",@"+10 goldern followers (worth $3.99) every days\nto keep your follower growing steadily ⚡️⚡️⚡️.",@"Find out your profile stalkers, who unfollowed\nyou and who has blocked you recently.",@"Your orders of followers,likers or views will be\ndelivered 300% faster than non-VIP users.",@"We will compensate you with extra followers if\nanyone unfollow you in the first week.",@"Select your favourite follower by gender, age\ngroup and location."];
    diffcolorarray=@[@[],@[@"worth $3.99"],@[@"profile stalkers, who unfollowed\nyou",@"who has blocked you"],@[@"orders",@"300% faster"],@[@"compensate",@"extra followers"],@[@"gender, age\ngroup",@"location."]];
    [self.lottieoutsidecircle setAnimationNamed:[array objectAtIndex:self.itemIndex]];
    self.lottieoutsidecircle.loopAnimation=YES;
    self.lottieoutsidecircle.contentMode = UIViewContentModeScaleAspectFit;

    [self.lottieCircle setAnimationNamed:@"circle"];
    self.lottieCircle.animationProgress=1.0;
    self.lottieCircle.contentMode = UIViewContentModeScaleAspectFit;

    

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UIFont *font=[UIFont fontWithName:@"GothamRounded-Medium" size:15];
    if (self.itemIndex==0||self.itemIndex==2) {
  self.centerimage.layer.cornerRadius=self.centerimage.frame.size.width/2.0;
        self.centerimage.layer.borderColor=[[UIColor whiteColor] CGColor];
        self.centerimage.layer.borderWidth=1.5;
        self.centerimage.layer.masksToBounds=YES;
        [self.centerimage setHidden:NO];
        if (self.itemIndex==2) {
             [self.lottieoutsidecircle play];
            [self.freetriallbl setHidden:YES];
            [self.othertitle setHidden:NO];
            [self.otherdesc setHidden:NO];
            [self.crownimageview setHidden:YES];


        }
        else{
            [self.othertitle setHidden:YES];
            [self.otherdesc setHidden:YES];
            [self.crownimageview setHidden:NO];
            [self.freetriallbl setHidden:NO];
        }
        
    }
    else{
        [self.crownimageview setHidden:YES];

        [self.freetriallbl setHidden:YES];
        [self.othertitle setHidden:NO];
        [self.otherdesc setHidden:NO];
         [self.lottieoutsidecircle play];
        [self.centerimage setHidden:YES];
        
    }
    [self.othertitle setText:[titlearray objectAtIndex:_itemIndex]];
    [self.otherdesc setText:[descarray objectAtIndex:_itemIndex]];
    NSArray<NSString*> *strarray=[diffcolorarray objectAtIndex:_itemIndex];
    self.otherdesc.linespacing=7;

    for (NSString *str in strarray) {
        [self.otherdesc setTextColor:UIColor.yellowColor String:str];
        [self.otherdesc setFont:font forString:str];

    }
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}


@end
