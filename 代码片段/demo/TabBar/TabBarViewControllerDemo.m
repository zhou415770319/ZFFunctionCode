//
//  TabBarViewControllerDemo.m
//  代码片段
//
//  Created by w on 16/5/30.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "TabBarViewControllerDemo.h"
#import "ZFTabBar.h"

@interface TabBarViewControllerDemo ()<ZFTabBarViewDelegate>

@property (nonatomic, strong)ZFTabBar * tabBarView;

/**
 *  记录上次点击按钮的索引
 */
@property (nonatomic, assign) NSUInteger lastIndex;

@end

@implementation TabBarViewControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController * vc1 = [[UIViewController alloc]init];
    UIViewController * vc2 = [[UIViewController alloc]init];
    UIViewController * vc3 = [[UIViewController alloc]init];
    vc1.view.backgroundColor = [UIColor redColor];
    vc2.view.backgroundColor = [UIColor blueColor];
    vc3.view.backgroundColor = [UIColor brownColor];

    UINavigationController * nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    [nav1.navigationBar setBarStyle:UIBarStyleBlack];
    [vc1 setTitle:@"发现"];
    UINavigationController * nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    [vc2 setTitle:@"故事"];
    UINavigationController * nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    [vc3 setTitle:@"我"];

    self.viewControllers = @[nav1,nav2,nav3];
    
    
    
    [self.tabBar removeFromSuperview];
    
    NSMutableArray * array = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tab_buddy_nor.png"],[UIImage imageNamed:@"tab_me_nor.png"],[UIImage imageNamed:@"tab_qworld_nor.png"],[UIImage imageNamed:@"tab_recent_nor.png"],[UIImage imageNamed:@"tab_recent_press.png"], nil];
    NSMutableArray * selectedArray = [[NSMutableArray alloc]initWithObjects:[UIImage imageNamed:@"tab_buddy_press.png"],[UIImage imageNamed:@"tab_me_press.png"],[UIImage imageNamed:@"tab_qworld_press.png"],[UIImage imageNamed:@"tab_recent_press.png"],[UIImage imageNamed:@"tab_recent_press.png"], nil];
    NSMutableArray * titles = [[NSMutableArray alloc]initWithObjects:@"场 馆 预 定",@"停  车",@"发  现",@"我",@"heh", nil];
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:1];
    [arr addObjectsFromArray:@[@"tab_buddy_nor.png",@"tab_me_nor.png",@"tab_qworld_nor.png"]];
    NSMutableArray *arr1 = [NSMutableArray arrayWithCapacity:1];
    [arr1 addObjectsFromArray:@[@"tab_buddy_press.png",@"tab_me_press.png",@"tab_qworld_press.png"]];
    self.tabBarView = [[ZFTabBar alloc]initWithImages:arr SelectImages:arr1 titles:titles];
    
//    self.tabBarView = [[ZFTabBar alloc]initWithItemSelectedImages:selectedArray normalImages:array titles:titles];
    self.tabBarView.backgroundColor = [UIColor whiteColor];
    self.tabBarView.frame =CGRectMake(0, SCREENHEIGHT - 49, SCREENWIDTH, 49);
    [self.tabBarView tabBarBadgeValue:10 item:1];
    self.tabBarView.delegate = self;
    [self.view addSubview:self.tabBarView];
    self.tabBarView.itemSelectedIndex = 0;

}


#pragma mark - TabBarViewDelegate
-(void)tabBarViewSelectedItem:(NSInteger)index{
    self.lastIndex = index;
    self.selectedIndex = index;
    
    
}

//-(void)centerButtonClick:(UIButton *)button{
//    [self.delegate tabBarViewCenterItemClick:button];
//}


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
