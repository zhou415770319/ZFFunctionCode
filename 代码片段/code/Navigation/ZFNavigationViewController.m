//
//  ZFNavigationViewController.m
//  代码片段
//
//  Created by w on 16/5/30.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFNavigationViewController.h"

@interface ZFNavigationViewController ()

@end

@implementation ZFNavigationViewController

/**
 *  初始化（每一个类只会调用一次）
 */

+ (void)initialize
{
    
}


-(void)popToViewController:(UIViewController *)viewController{
    NSArray *ctrlArray = self.navigationController.viewControllers;
    
    for (UIViewController *ctrl in ctrlArray) {
        
        if ([ctrl isKindOfClass:[viewController class]]) {
            [self.navigationController popToViewController:ctrl animated:YES];
        }
        
    }
    
}

//隐藏navigation
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (_isHidden) {
        [self.navigationController setNavigationBarHidden:YES];
    }else{
        [self.navigationController setNavigationBarHidden:NO];
    }
    
    
}
//显示navigation
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (_isHidden) {
        [self.navigationController setNavigationBarHidden:NO];
    }else{
        [self.navigationController setNavigationBarHidden:YES];
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
