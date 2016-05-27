//
//  ZFCollectionViewLayoutCircleTypeViewController.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewLayoutCircleTypeViewController.h"

@interface ZFCollectionViewLayoutCircleTypeViewController ()<UICollectionViewDelegate>

@end

@implementation ZFCollectionViewLayoutCircleTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionV.delegate = self;
    ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
    lay.layoutType =ZFCollectionViewLayoutCircleType;
    lay.itemSize =CGSizeMake(100, 100);

    [self changeLayout:lay];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////layout自定义
//-(void)loadCellData{
//    //数据转换成model
//    ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
//    lay.layoutType =ZFCollectionViewLayoutCircleType;
//    lay.itemSize =CGSizeMake(100, 100);
//    
//    self.collectionV = [[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,  self.view.frame.size.height-64) collectionViewLayout:lay];
//    //    collectionV.layout = [[ZFCollectionViewLayout alloc] layoutType:ZFCollectionViewLayoutStackType];
//    //    collectionV.backgroundColor = [UIColor redColor];
//    self.collectionV.cellInfos = self.infos;
//    [self.view addSubview:self.collectionV];
//    
//}

#pragma mark - <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZFCollectionViewCellModel *cellInfo = self.collectionV.cellInfos[indexPath.item];
    [self.collectionV.cellInfos removeObjectAtIndex:indexPath.item];
//    [self.collectionV.cellInfos addObject:cellInfo];
        [self.collectionV.cellInfos insertObject:cellInfo atIndex:0];
    [collectionView reloadData];
    
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
