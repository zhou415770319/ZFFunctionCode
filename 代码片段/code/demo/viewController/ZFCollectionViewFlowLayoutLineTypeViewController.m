//
//  ZFCollectionViewFlowLayoutLineTypeViewController.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionViewFlowLayoutLineTypeViewController.h"

@interface ZFCollectionViewFlowLayoutLineTypeViewController ()

@end

@implementation ZFCollectionViewFlowLayoutLineTypeViewController


/*
 懒加载数据
 */
//-(NSMutableArray *)infos{
//    
//    if (_infos == nil) {
//        NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"zhou",@"fei",@"shi",@"ge",@"da",@"hun",@"dan",@"hehe", nil];
//        NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:1];
//        
//        for (int i =0; i < arr.count; i++) {
//            
//            ZFCollectionViewCellModel *model = [[ZFCollectionViewCellModel alloc] init];
//            model.title = arr[i];
//            //waterfallType 必须设置的参数
//            model.itemWidth =100;
//            model.itemHeight =100;
//            
//            //            if (i != 3) {
//            //                model.cellName =@"ZFCollectionViewCell";
//            //            }else{
//            //                model.cellName =@"ZFCollectionViewCell";
//            
//            model.xibCellName =@"xib1CollectionViewCell";
//            //            }
//            
//            model.imgName =[NSString stringWithFormat:@"%i",i];
//            [arr1 addObject:model];
//        }
//        _infos = arr1;
//    }
//    
//    return _infos;
//}
//-(ZFCollectionView *)collectionV{
//    
//    if (!_collectionV) {
//        ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
//        lay.layoutType =ZFCollectionViewLayoutCircleType;
//        
//        //        lay.itemSize =CGSizeMake(100, 100);
//        
//        _collectionV =[[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,  self.view.frame.size.width) collectionViewLayout:lay];
//        _collectionV.backgroundColor =[UIColor blueColor];
//        _collectionV.alpha = 0.6;
//        self.collectionV.cellInfos = self.infos;
//        [self.view addSubview:self.collectionV];
//    }
//    
//    return _collectionV;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZFCollectionViewFlowLayout *lay =[[ZFCollectionViewFlowLayout alloc] init];
    lay.flowLayoutType =ZFCollectionViewFlowLayoutLineType;
    lay.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
//    _collectionV =[[ZFCollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:lay];
//    _collectionV.backgroundColor =[UIColor redColor];
//    _collectionV.alpha = 0.6;
//    _collectionV.pagingEnabled = YES;
//    self.collectionV.cellInfos = self.infos;
//    [self.view addSubview:self.collectionV];

    

    [self changeLayout:lay];
    
    self.collectionV.pagingEnabled =YES;
        
    

    // Do any additional setup after loading the view.
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.collectionV setContentOffset:CGPointMake(0, 0)];
    [self.collectionV layoutIfNeeded];
    
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
