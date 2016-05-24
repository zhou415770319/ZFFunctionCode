//
//  ZFBaseCollectionViewController.m
//  代码片段
//
//  Created by w on 16/5/19.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFBaseCollectionViewController.h"

@interface ZFBaseCollectionViewController ()

@end

@implementation ZFBaseCollectionViewController
/*
 懒加载数据
 */
-(NSMutableArray *)infos{
    
    if (_infos == nil) {
        NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"zhou",@"fei",@"shi",@"ge",@"da",@"hun",@"dan",@"hehe", nil];
        NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:1];
        
        for (int i =0; i < arr.count; i++) {
            
            ZFCollectionViewCellModel *model = [[ZFCollectionViewCellModel alloc] init];
            model.title = arr[i];
            
            if (i != 3) {
                model.cellName =@"ZFCollectionViewCell";
            }else{
//                model.cellName =@"ZFCollectionViewCell";
                
                  model.xibCellName =@"xibCollectionViewCell";
            }
            
            model.imgName =[NSString stringWithFormat:@"%i",i];
            [arr1 addObject:model];
        }
        _infos = arr1;
    }
    
    return _infos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadCellData];

    // Do any additional setup after loading the view.
}

//layout自定义
-(void)loadCellData{
    //数据转换成model
    ZFCollectionViewLayout *lay =[[ZFCollectionViewLayout alloc] init];
    lay.layoutType =ZFCollectionViewLayoutCircleType;
    

    lay.itemSize =CGSizeMake(100, 100);
    
    self.collectionV = [[ZFCollectionView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width,  self.view.frame.size.height-64) collectionViewLayout:lay];
    //    collectionV.layout = [[ZFCollectionViewLayout alloc] layoutType:ZFCollectionViewLayoutStackType];
//    collectionV.backgroundColor = [UIColor redColor];
    self.collectionV.cellInfos = self.infos;
    [self.view addSubview:self.collectionV];
    
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
