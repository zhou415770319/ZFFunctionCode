//
//  ZFCollectionViewFlowLayoutWaterfallTypeViewController.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewFlowLayoutWaterfallTypeViewController.h"

@interface ZFCollectionViewFlowLayoutWaterfallTypeViewController ()

@end

@implementation ZFCollectionViewFlowLayoutWaterfallTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadCellData{
    //数据转换成model
    ZFCollectionViewFlowLayout *lay =[[ZFCollectionViewFlowLayout alloc] init];
    lay.flowLayoutType =ZFCollectionViewFlowLayoutLineType;
    
    lay.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.collectionV = [[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,  self.view.frame.size.height-64) collectionViewLayout:lay];
    //ZFCollectionViewFlowLayoutLineType pagingEnabled不需要设置
    self.collectionV.pagingEnabled =YES;
    
    self.collectionV.cellInfos = self.infos;
    [self.view addSubview:self.collectionV];
    
    
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
