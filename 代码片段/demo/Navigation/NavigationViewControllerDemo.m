//
//  NavigationViewControllerDemo.m
//  代码片段
//
//  Created by w on 16/5/27.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "NavigationViewControllerDemo.h"

@interface NavigationViewControllerDemo ()

@end

@implementation NavigationViewControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
//    titleView.backgroundColor = [UIColor clearColor];
//    
//    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
//    titleLabel.text = @"周飞";
//    titleLabel.font = [UIFont systemFontOfSize:18.0f];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    [titleView addSubview:titleLabel];
//    
//    UILabel *miniLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 30, 150, 10)];
//    miniLabel.font = [UIFont systemFontOfSize:11.0f];
//    miniLabel.textColor = [UIColor whiteColor];
//    
//    miniLabel.text =@"和化肥";
//    
//    miniLabel.textAlignment = NSTextAlignmentCenter;
//    
//    [titleView addSubview:miniLabel];
//
//    
//    self.navigationItem.titleView = titleView;

    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    btn.backgroundColor =[UIColor redColor];
    [btn setTitle:@"功能" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // Do any additional setup after loading the view.
}

-(void)clickBtn:(UIButton *)btn{
    
    
    
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
