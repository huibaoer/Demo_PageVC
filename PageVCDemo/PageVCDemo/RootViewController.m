//
//  RootViewController.m
//  PageVCDemo
//
//  Created by zhanght on 2016/11/29.
//  Copyright © 2016年 zhanght. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface RootViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property (nonatomic, strong) FirstViewController *first;
@property (nonatomic, strong) SecondViewController *second;
@property (nonatomic, strong) ThirdViewController *third;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    self.pageViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.pageViewController.view];
    [self addChildViewController:self.pageViewController];
    
    self.first = [[FirstViewController alloc] init];
    self.second = [[SecondViewController alloc] init];
    self.third = [[ThirdViewController alloc] init];
    [self.pageViewController setViewControllers:@[self.first] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        NSLog(@"-- ht log -- complete");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    if (viewController == self.third) return self.second;
    if (viewController == self.second) return self.first;
    return nil;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    if (viewController == self.first) return self.second;
    if (viewController == self.second) return self.third;
    return nil;
}

@end
