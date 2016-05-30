//
//  ScrollViewControllerDemo.m
//  代码片段
//
//  Created by w on 16/5/26.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ScrollViewControllerDemo.h"
#import "ZFScrollView.h"
#import "ZFNavigationViewController.h"
@interface ScrollViewControllerDemo ()<ZFScrollViewDelegate>

@property (nonatomic,retain)ZFScrollView *scrollV;


@property (nonatomic,retain)NSMutableArray *infos;

@end

@implementation ScrollViewControllerDemo


-(NSArray *)infos{
    
    if (!_infos) {
        _infos = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
        
    }
    
    return _infos;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];

    
    ZFScrollView *scrollV = [[ZFScrollView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 300)];
    
    scrollV.infos =self.infos;
    scrollV.backgroundColor =[UIColor whiteColor];
    scrollV.isAddTimer =YES;
    //默认2.0秒
    //    scrollV.animationDuration =5;
    scrollV.delegate = self;
    scrollV.isAddButton = YES;
    [self.view addSubview:scrollV];
    
    
    //UIViewController的属性propertyautomaticallyAdjustsScrollViewInsets默认增加了填充，若要照自己设置的全屏滚动修改
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    
    // Do any additional setup after loading the view.
}


-(void)clickNextBtn{
    NSLog(@"clickNextBtn");
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
