//
//  StoreViewController.m
//  animationdemo
//
//  Created by fluxtech_macmini1 on 04/12/18.
//  Copyright © 2018 fluxtech_macmini1. All rights reserved.
//

#import "StoreViewController.h"
#import "AppDelegate.h"
#import "GradientPageViewController-Swift.h"
#import "PageItemViewController.h"
#define degreesToRadians(x) ((x) * M_PI / 180.0)

@interface StoreViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate,UIScrollViewDelegate>{
    CAGradientLayer *gradient;
    PageItemViewController *currentitemcontroller;
    PageItemViewController *nextitemcontroller;
    CGFloat sourcetopred1, sourcetopgreen1, sourcetopblue1, sourcetopalpha1;
    CGFloat destopred2, destopgreen2, destopblue2, destopalpha2;
    
    CGFloat sourcebottomred1, sourcebottomgreen1, sourcebottomblue1, sourcebottomalpha1;
    
    CGFloat desbottomred2, desbottomgreen2, desbottomblue2, desbottomalpha2;
    
    CGFloat difftopred,difftopgreen,difftopblue;
    CGFloat diffbottomred,diffbottomgreen,diffbottomblue;
    
}
@property (weak, nonatomic) IBOutlet CustomHorizontalProgressView *horizontalprogess;
@property (weak, nonatomic) IBOutlet UIView *downarrowview;
@property (nonatomic, strong) UIPageViewController *pageViewController;
//temp
@property (nonatomic, strong) LOTAnimationView *lottiechekbox1;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel1;
@property (weak, nonatomic) IBOutlet CustomizeBorderView *custmizeview;
@property (weak, nonatomic) IBOutlet UIView *backgroundview;

@property (nonatomic, strong) LOTAnimationView *lottiechekbox2;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel2;


@property (nonatomic, strong) LOTAnimationView *lottiechekbox3;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel3;


@property (nonatomic, strong) LOTAnimationView *lottiechekbox4;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel4;

@property (nonatomic, strong) LOTAnimationView *lottiechekbox5;
@property (nonatomic, strong) TypewriterLabel *typewriterlabel5;
@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CAGradientLayer *gradientLayer=[CAGradientLayer layer];
    gradientLayer.colors = @[(id)[UIColor colorWithRed:250/255.0 green:221/255.0 blue:208/255.0 alpha:1.0].CGColor,(id)[UIColor colorWithRed:250/255.0 green:221/255.0 blue:208/255.0 alpha:1.0].CGColor];
    
    gradientLayer.transform = CATransform3DMakeRotation(3.14222f / 2, 0, 0, 1);
    
    gradientLayer.frame = CGRectMake(CGRectGetMinX(_horizontalprogess.bounds)-10, CGRectGetMinY(_horizontalprogess.bounds)-10, _horizontalprogess.bounds.size.width+20, _horizontalprogess.bounds.size.height+20);
    gradientLayer.cornerRadius = gradientLayer.frame.size.height/2.0;
    gradientLayer.masksToBounds = true;
    
    CALayer *shadowlayer=[CALayer layer];
    shadowlayer.frame=gradientLayer.bounds;
    shadowlayer.shadowColor=UIColor.blackColor.CGColor;
    shadowlayer.shadowOpacity=0.25;
    shadowlayer.shadowRadius=20;
    shadowlayer.shadowPath=CGPathCreateWithRect(shadowlayer.bounds, nil);
    gradientLayer.mask=shadowlayer;
    [_backgroundview.layer insertSublayer:gradientLayer below:_horizontalprogess.layer];


    
    _pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageController"];
    
    _pageViewController.dataSource = self;
    _pageViewController.delegate=self;
    if (IS_IPHONE_6) {
          self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-180);
    }
    else{
         self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-200);
    }
   
    for (UIView *view in self.pageViewController.view.subviews) {
        if ([view isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)view setDelegate:self];
        }
    }
    UIView *myview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-150)];
     [self.view addSubview:myview];

    UIBezierPath *curve1 = [UIBezierPath bezierPath];
                            
   [curve1 moveToPoint:CGPointMake(0, 0)];
    [curve1 addLineToPoint: CGPointMake(self.view.frame.size.width, 0)];
    [curve1 addLineToPoint: CGPointMake(self.view.frame.size.width, myview.frame.size.height-24)];

    [curve1 addCurveToPoint: CGPointMake(0, self.view.frame.size.height-150 - 24)
              controlPoint1: CGPointMake(self.view.frame.size.width / 1.5, self.view.frame.size.height-150-5)
              controlPoint2: CGPointMake(self.view.frame.size.width/2.5, self.view.frame.size.height-150-5)];
    [curve1 closePath];
    
    CAShapeLayer *ex1Layer = [CAShapeLayer layer];
    [ex1Layer setFrame: CGRectMake(0, 0, self.view.frame.size.width, myview.frame.size.height)];
    [ex1Layer setFillColor: [UIColor brownColor].CGColor];
    [ex1Layer setPath: curve1.CGPath];
    
    gradient = [CAGradientLayer layer];
    gradient.frame = ex1Layer.frame;
     gradient.colors = @[(id)[UIColor colorWithRed:0.282 green:0.616 blue:1.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.106 green:0.161 blue:0.761 alpha:1.0].CGColor];
    gradient.mask=ex1Layer;
    
    [myview.layer insertSublayer:gradient atIndex:0];
    
    [self addChildViewController:self.pageViewController];
  
    _pageViewController.view.backgroundColor=[UIColor clearColor];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    NSArray *array=@[[self itemControllerForIndex:0]];
    [_custmizeview.superview bringSubviewToFront: _custmizeview];
    [_downarrowview.superview bringSubviewToFront: _downarrowview];
    [self.pageViewController setViewControllers:array direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
        PageItemViewController *item=[array objectAtIndex:0];
        self->_scrollview=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
        self->_scrollview.showsVerticalScrollIndicator=NO;
        [item.scrollviewcontainer addSubview:self->_scrollview];
        self->_scrollview.scrollEnabled=NO;
        self->_scrollview.contentSize=CGSizeMake(self.view.frame.size.width, 180);
        
                self.lottiechekbox1 = [LOTAnimationView animationNamed:@"checkbox"];
                self.lottiechekbox1.contentMode=UIViewContentModeScaleAspectFit;
        [self->_scrollview addSubview:self.lottiechekbox1];
        
                self.lottiechekbox2 = [LOTAnimationView animationNamed:@"checkbox"];
                self.lottiechekbox2.contentMode=UIViewContentModeScaleAspectFit;
        [self->_scrollview addSubview:self.lottiechekbox2];
        
                self.lottiechekbox3 = [LOTAnimationView animationNamed:@"checkbox"];
                self.lottiechekbox3.contentMode=UIViewContentModeScaleAspectFit;
        [self->_scrollview addSubview:self.lottiechekbox3];
        
                self.lottiechekbox4 = [LOTAnimationView animationNamed:@"checkbox"];
                self.lottiechekbox4.contentMode=UIViewContentModeScaleAspectFit;
        [self->_scrollview addSubview:self.lottiechekbox4];
        
                self.lottiechekbox5 = [LOTAnimationView animationNamed:@"checkbox"];
                self.lottiechekbox5.contentMode=UIViewContentModeScaleAspectFit;
        [self->_scrollview addSubview:self.lottiechekbox5];
        
                self.lottiechekbox1.frame=CGRectMake(30, 0, 20, 20);
        self->_typewriterlabel1=[[TypewriterLabel alloc] initWithFrame:CGRectMake(60, 1, self.view.frame.size.width-50, 20)];
        [self->_typewriterlabel1 setBackgroundColor:[UIColor clearColor]];
        [self->_typewriterlabel1 setTextColor:[UIColor whiteColor]];
    
        [self->_typewriterlabel1 setFont:[UIFont fontWithName:@"GothamRounded-Book" size:16]];
        [self->_typewriterlabel1 setText:@"Get 10 bonus follower every days"];
        [self->_scrollview addSubview:self->_typewriterlabel1];
        
                //second text
        self.lottiechekbox2.frame=CGRectMake(30, CGRectGetMaxY(self->_lottiechekbox1.frame)+20, 20, 20);
        self->_typewriterlabel2=[[TypewriterLabel alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(self->_lottiechekbox1.frame)+20+1, self.view.frame.size.width-50, 20)];
        [self->_typewriterlabel2 setBackgroundColor:[UIColor clearColor]];
        [self->_typewriterlabel2 setTextColor:[UIColor whiteColor]];
        [self->_typewriterlabel2 setFont:[UIFont fontWithName:@"GothamRounded-Book" size:16]];
        [self->_typewriterlabel2 setText:@"No follower drop guaranteed"];
        [self->_scrollview addSubview:self->_typewriterlabel2];
        
                //third text
        self.lottiechekbox3.frame=CGRectMake(30, CGRectGetMaxY(self->_lottiechekbox2.frame)+20, 20, 20);
        self->_typewriterlabel3=[[TypewriterLabel alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(self->_lottiechekbox2.frame)+20+1, self.view.frame.size.width-50, 20)];
        [self->_typewriterlabel3 setBackgroundColor:[UIColor clearColor]];
        [self->_typewriterlabel3 setTextColor:[UIColor whiteColor]];
        [self->_typewriterlabel3 setFont:[UIFont fontWithName:@"GothamRounded-Book" size:16]];
        [self->_typewriterlabel3 setText:@"Find who stalk your profile"];
        [self->_scrollview addSubview:self->_typewriterlabel3];
        
        
                //four text
        self.lottiechekbox4.frame=CGRectMake(30, CGRectGetMaxY(self->_lottiechekbox3.frame)+20, 20, 20);
        self->_typewriterlabel4=[[TypewriterLabel alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(self->_lottiechekbox3.frame)+20+1, self.view.frame.size.width-50, 20)];
        [self->_typewriterlabel4 setBackgroundColor:[UIColor clearColor]];
        [self->_typewriterlabel4 setTextColor:[UIColor whiteColor]];
        [self->_typewriterlabel4 setFont:[UIFont fontWithName:@"GothamRounded-Book" size:16]];
        [self->_typewriterlabel4 setText:@"Find who is your ghost follower"];
        [self->_scrollview addSubview:self->_typewriterlabel4];
        
                //five text
        self.lottiechekbox5.frame=CGRectMake(30, CGRectGetMaxY(self->_lottiechekbox4.frame)+20, 20, 20);
        self->_typewriterlabel5=[[TypewriterLabel alloc] initWithFrame:CGRectMake(60, CGRectGetMaxY(self->_lottiechekbox4.frame)+20+1, self.view.frame.size.width-50, 20)];
        [self->_typewriterlabel5 setBackgroundColor:[UIColor clearColor]];
        [self->_typewriterlabel5 setTextColor:[UIColor whiteColor]];
        [self->_typewriterlabel5 setFont:[UIFont fontWithName:@"GothamRounded-Book" size:16]];
        [self->_typewriterlabel5 setText:@"Find who is your nonfollower"];
        [self->_scrollview addSubview:self->_typewriterlabel5];
        
        
                [self.lottiechekbox1 playWithCompletion:^(BOOL animationFinished) {
        
                }];
        
                [self->_typewriterlabel1 startTypewritingAnimationWithCompletion:^{
                    [self.lottiechekbox2 playWithCompletion:^(BOOL animationFinished) {
        
                    }];
        
                    [self->_typewriterlabel2 startTypewritingAnimationWithCompletion:^{
        
                        [self.lottiechekbox3 playWithCompletion:^(BOOL animationFinished) {
        
                        }];
                        [self->_typewriterlabel3 startTypewritingAnimationWithCompletion:^{
                            [self->_scrollview setContentOffset:CGPointMake(0, CGRectGetMinY(self->_lottiechekbox2.frame)) animated:YES];
                            [self.lottiechekbox4 playWithCompletion:^(BOOL animationFinished) {
        
                            }];
                            [self->_typewriterlabel4 startTypewritingAnimationWithCompletion:^{
                                [self->_scrollview setContentOffset:CGPointMake(0, CGRectGetMinY(self->_lottiechekbox3.frame)) animated:YES];
                                [self.lottiechekbox5 playWithCompletion:^(BOOL animationFinished) {
        
                                }];
                                [self->_typewriterlabel5 startTypewritingAnimationWithCompletion:^{
                                    self->_scrollview.scrollEnabled=YES;
        
                                }];
        
                            }];
        
                        }];
        
                    }];
        
                }];
        
    }];

}
- (PageItemViewController *)itemControllerForIndex:(NSUInteger)itemIndex
{
//

   
    PageItemViewController *pageItemController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageItemViewController"];
    pageItemController.itemIndex = itemIndex;
    if (itemIndex==0) {
        pageItemController.mytopcolor=[UIColor colorWithRed:0.282 green:0.616 blue:1.0 alpha:1.0];
        pageItemController.mybottomcolor=[UIColor colorWithRed:0.106 green:0.161 blue:0.761 alpha:1.0];
    }
    else if (itemIndex==1) {
        pageItemController.mytopcolor=[UIColor colorWithRed:0.949 green:0.651 blue:0.376 alpha:1.0];
        pageItemController.mybottomcolor=[UIColor colorWithRed:0.929 green:0.325 blue:0.333 alpha:1.0];
    }
    else if (itemIndex==2){
        pageItemController.mytopcolor=[UIColor colorWithRed:0.506 green:0.294 blue:0.906 alpha:1.0];
        pageItemController.mybottomcolor=[UIColor colorWithRed:0.294 green:0.208 blue:1 alpha:1.0];


    }
    else if (itemIndex==3){
        pageItemController.mytopcolor=[UIColor colorWithRed:0.8 green:0.251 blue:0.09 alpha:1.0];

        pageItemController.mybottomcolor=[UIColor colorWithRed:0.925 green:0.18 blue:0.443 alpha:1.0];

    }
    else if (itemIndex==4){
        pageItemController.mytopcolor=[UIColor colorWithRed:0.208 green:0.51 blue:0.482 alpha:1.0];

        pageItemController.mybottomcolor=[UIColor colorWithRed:0.322 green:0.733 blue:0.867 alpha:1.0];

    }
    else if (itemIndex==5){
        pageItemController.mytopcolor=[UIColor colorWithRed:0.576 green:0.275 blue:0.922 alpha:1.0];

        
        pageItemController.mybottomcolor=[UIColor colorWithRed:0.459 green:0.416 blue:1 alpha:1.0];
;
    }
    else{
        pageItemController.mytopcolor=[UIColor colorWithRed:0.282 green:0.616 blue:1.0 alpha:1.0];
        pageItemController.mybottomcolor=[UIColor colorWithRed:0.467 green:0.451 blue:1 alpha:1.0];
;
    }
       
        return pageItemController;
  
}
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    PageItemViewController *itemController = (PageItemViewController *)viewController;
    
    if (itemController.itemIndex > 0)
    {
        return [self itemControllerForIndex:itemController.itemIndex-1];
    }
    else{
         return [self itemControllerForIndex:5];
    }
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
 
    PageItemViewController *itemController = (PageItemViewController *)viewController;
    
    if (itemController.itemIndex+1 < 6)
    {
       
        return [self itemControllerForIndex:itemController.itemIndex+1];
    }
    else{
         return [self itemControllerForIndex:0];
    }
    return nil;
}
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers NS_AVAILABLE_IOS(6_0){

    nextitemcontroller=(PageItemViewController*)[pendingViewControllers objectAtIndex:0];
    currentitemcontroller=(PageItemViewController*)[self currentController];
    
    [currentitemcontroller.mytopcolor getRed:&sourcetopred1 green:&sourcetopgreen1 blue:&sourcetopblue1 alpha:&sourcetopalpha1];
    [nextitemcontroller.mytopcolor getRed:&destopred2 green:&destopgreen2 blue:&destopblue2 alpha:&destopalpha2];
    
    [currentitemcontroller.mybottomcolor getRed:&sourcebottomred1 green:&sourcebottomgreen1 blue:&sourcebottomblue1 alpha:&sourcebottomalpha1];
    [nextitemcontroller.mybottomcolor getRed:&desbottomred2 green:&desbottomgreen2 blue:&desbottomblue2 alpha:&desbottomalpha2];
   
    difftopred=sourcetopred1-destopred2;
    difftopgreen=sourcetopgreen1-destopgreen2;
    difftopblue=sourcetopblue1-destopblue2;
    
    diffbottomred=sourcebottomred1-desbottomred2;
    diffbottomgreen=sourcebottomgreen1-desbottomgreen2;
    diffbottomblue=sourcebottomblue1-desbottomblue2;
   
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    if (completed) {
        [currentitemcontroller.lottieoutsidecircle pause];
        PageItemViewController *item=(PageItemViewController*)[self currentController];
        if (item.itemIndex==0) {
            if (_scrollview.scrollEnabled) {
                [_scrollview removeFromSuperview];
                [item.scrollviewcontainer addSubview:_scrollview];
            }
        }
    }
   
//    PageItemViewController *item=(PageItemViewController*)[self currentController];
//    gradient.colors=@[(id)item.mytopcolor.CGColor,(id)item.mybottomcolor.CGColor];
//    if (completed) {
//        NSLog(@"end %li",currentindex);
//
//    }
//
//
//            if ((currentindex+1)%2==0) {
//
//
//                gradient.colors = @[(id)[UIColor colorWithRed:0.949 green:0.651 blue:0.376 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.929 green:0.325 blue:0.333 alpha:1.0].CGColor];
//
//
//            }
//            else{
//
//                  gradient.colors = @[(id)[UIColor colorWithRed:0.282 green:0.616 blue:1.0 alpha:1.0].CGColor, (id)[UIColor colorWithRed:0.106 green:0.161 blue:0.761 alpha:1.0].CGColor];
//            }
    
   
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    float percentComplete;
    NSLog(@"xis %f",point.x);
    NSLog(@"width %f",self.view.frame.size.width);
    percentComplete = fabs(point.x - self.view.frame.size.width)/self.view.frame.size.width;
    NSLog(@"per %f",percentComplete);

    
    if (percentComplete>0.01) {
        currentitemcontroller.lottieCircle.animationProgress=1-percentComplete;
       

        nextitemcontroller.lottieCircle.animationProgress=percentComplete;
        CGFloat topred=sourcetopred1-(difftopred*percentComplete);
        CGFloat topgreen=sourcetopgreen1-(difftopgreen*percentComplete);
        CGFloat topblue=sourcetopblue1-(difftopblue*percentComplete);
        
        CGFloat bottomred=sourcebottomred1-(diffbottomred*percentComplete);
        CGFloat bottomgreen=sourcebottomgreen1-(diffbottomgreen*percentComplete);
        CGFloat bottomblue=sourcebottomblue1-(diffbottomblue*percentComplete);
        
        gradient.colors=@[(id)[UIColor colorWithRed:topred green:topgreen blue:topblue alpha:1.0].CGColor,(id)[UIColor colorWithRed:bottomred green:bottomgreen blue:bottomblue alpha:1.0].CGColor];
        
      

    }
    
}
- (NSUInteger)currentControllerIndex
{
    PageItemViewController *pageItemController = (PageItemViewController *) [self currentController];
    
    if (pageItemController)
    {
        return pageItemController.itemIndex;
    }
    
    return -1;
}

- (UIViewController *)currentController
{
    if ([self.pageViewController.viewControllers count])
    {
        return self.pageViewController.viewControllers[0];
    }
    
    return nil;
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 6;

}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (IBAction)closeBtnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}





@end
