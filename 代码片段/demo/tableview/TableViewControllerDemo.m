//
//  TableViewControllerDemo.m
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "TableViewControllerDemo.h"
#import "ZFTableView.h"

@interface TableViewControllerDemo ()

//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@end

@implementation TableViewControllerDemo


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
            
//            model.xibCellName =@"demo2TableViewCell";
            
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
    
    ZFTableView *tab = [[ZFTableView alloc]initWithFrame:self.tableView.bounds];
    tab.cellInfos = self.infos;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tab];
//     self.tableView = tab;
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;

}


//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell =nil;
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//    ZFTableViewCellModel *model =self.infos[indexPath.row];
//    cell.textLabel.text =model.title;
//    
//    return cell;
//}


@end
