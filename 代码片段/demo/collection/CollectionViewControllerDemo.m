//
//  CollectionViewControllerDemo.m
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "CollectionViewControllerDemo.h"
#import "ZFTableView.h"

@interface CollectionViewControllerDemo ()
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@end

@implementation CollectionViewControllerDemo

/*
 懒加载数据
 */
-(NSMutableArray *)infos{
    
    if (_infos == nil) {
        NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"ZFCollectionViewLayoutCircleType",@"ZFCollectionViewLayoutStackType",@"ZFCollectionViewFlowLayoutRotatePageType",@"ZFCollectionViewFlowLayoutWaterfallType",@"ZFCollectionViewFlowLayoutLineType", nil];
        NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:1];
        
        for (int i =0; i < arr.count; i++) {
            
            ZFTableViewCellModel *model = [[ZFTableViewCellModel alloc] init];
            model.title = arr[i];
            model.PopToViewController = [NSString stringWithFormat:@"%@ViewController",arr[i]];
            //            if (i != 1) {
            //                model.cellName =@"demoTableViewCell";
            //            }else{
            
            model.xibCellName =@"demo1TableViewCell";
            
            //            }
            
            //            model.imgName =[NSString stringWithFormat:@"%i",i];
            [arr1 addObject:model];
        }
        _infos = arr1;
    }
    
    return _infos;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    

    ZFTableView *tab = [[ZFTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tab.cellInfos = self.infos;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tab];
    
    
}


@end
