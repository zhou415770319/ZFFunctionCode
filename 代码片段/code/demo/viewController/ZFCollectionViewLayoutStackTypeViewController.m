//
//  ZFCollectionViewLayoutStackTypeViewController.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewLayoutStackTypeViewController.h"

@interface ZFCollectionViewLayoutStackTypeViewController ()

@end

@implementation ZFCollectionViewLayoutStackTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
    lay.layoutType =ZFCollectionViewLayoutStackType;
    lay.itemSize =CGSizeMake(200, 200);
    
    [self changeLayout:lay];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
////layout自定义
//-(void)loadCellData{
//    //数据转换成model
//    ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
//    lay.layoutType =ZFCollectionViewLayoutStackType;
//    lay.itemSize =CGSizeMake(200, 200);
//    
//    self.collectionV = [[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-64) collectionViewLayout:lay];
//    //    collectionV.layout = [[ZFCollectionViewLayout alloc] layoutType:ZFCollectionViewLayoutStackType];
//    //    collectionV.backgroundColor = [UIColor redColor];
//    self.collectionV.cellInfos = self.infos;
//    [self.view addSubview:self.collectionV];
//    
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
