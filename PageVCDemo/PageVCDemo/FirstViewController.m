//
//  FirstViewController.m
//  PageVCDemo
//
//  Created by zhanght on 2016/11/29.
//  Copyright © 2016年 zhanght. All rights reserved.
//

#import "FirstViewController.h"
#import "Header.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(id)sender {
    if (self.navigationController.navigationBarHidden) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        
        ALP_GWURL = @"http://test.gw.51zb.cn";
        
    } else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        
        ALP_GWURL = @"http://gw.51zb.cn";
    }
    
NSLog(@"-- ht log -- %@", ALP_GWURL);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
