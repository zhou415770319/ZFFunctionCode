//
//  FunctionTableViewController.m
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "FunctionTableViewController.h"
#import "ZFTableView.h"
@interface FunctionTableViewController ()

//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@end

@implementation FunctionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择";
    ZFTableView *tab = [[ZFTableView alloc]initWithFrame:self.tableView.frame];
    tab.cellInfos = self.infos;
    tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tab];
//    self.tableView = tab;
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 懒加载数据
 */
-(NSMutableArray *)infos{
    
    if (_infos == nil) {
        NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"TableViewController",@"CollectionViewController",@"ScrollViewController",@"NavigationViewController",@"TabBarViewController", nil];
        NSMutableArray *arr1 =[NSMutableArray arrayWithCapacity:1];
        
        for (int i =0; i < arr.count; i++) {
            
            ZFTableViewCellModel *model = [[ZFTableViewCellModel alloc] init];
            model.title = arr[i];
            model.PopToViewController = [NSString stringWithFormat:@"%@Demo",arr[i]];
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


@end
