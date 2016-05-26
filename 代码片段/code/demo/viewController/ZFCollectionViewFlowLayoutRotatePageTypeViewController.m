//
//  ZFCollectionViewFlowLayoutRotatePageTypeViewController.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewFlowLayoutRotatePageTypeViewController.h"
@interface ZFCollectionViewFlowLayoutRotatePageTypeViewController ()

@end

@implementation ZFCollectionViewFlowLayoutRotatePageTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ZFCollectionViewFlowLayout *lay =[[ZFCollectionViewFlowLayout alloc] init];
    lay.flowLayoutType =ZFCollectionViewFlowLayoutRotatePageType;
    lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    [self changeLayout:lay];
    
//    self.collectionV.pagingEnabled =YES;
    
//UIViewController的属性propertyautomaticallyAdjustsScrollViewInsets默认增加了填充，若要照自己设置的全屏滚动修改
    self.automaticallyAdjustsScrollViewInsets =NO;

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
