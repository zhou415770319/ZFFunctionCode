//
//  ZFHeaderTableViewController.m
//  代码片段
//
//  Created by w on 16/6/8.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFHeaderTableViewController.h"
#import "ZFTableView.h"
#import "AutolayoutView.h"

@interface ZFHeaderTableViewController ()
//显示数据
@property(nonatomic,retain)NSMutableArray *infos;

@property(nonatomic,retain)ZFTableView *tableView;

@end

@implementation ZFHeaderTableViewController

/*
 懒加载数据
 */
-(NSMutableArray *)infos{
    
    if (_infos == nil) {
        NSMutableArray *arr =[NSMutableArray arrayWithObjects:@"zhou",@"fei",@"shi",@"hun",@"dan", nil];
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
    
    self.tableView = [[ZFTableView alloc] initWithFrame:self.view.frame];
    //    _tableView.delegate = self;
    self.tableView.heightForHeader = 80;
//    self.tableView.heightForFooter = 100;
//    self.tableView.headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"4"]];
    //间距为10 实际row 高度60
    self.tableView.heightForRow = 70;
    //tableView 取消选择效果
    self.tableView.tableViewCellSelectionStyle = UITableViewCellSelectionStyleNone;
    //tableView 取消滚动效果
    self.tableView.scrollEnabled = NO;
    self.tableView.cellInfos = self.infos;
    self.tableView.scrollEnabled = YES;
    [self.view addSubview:self.tableView];

    [self addHeader];
    
}

-(void)addHeader{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, self.tableView.heightForHeader)];
    headerView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"7"]];
    headerView.alpha =0.97;
    UILabel *headerLab = [AutolayoutView autolayoutLableWithTitle:@"zhoufei"];
    UILabel *chargeLab = [AutolayoutView autolayoutLableWithTitle:@"hehe"];
    
    [headerView addSubview:headerLab];
    chargeLab.textAlignment = NSTextAlignmentRight;
    [headerView addSubview:chargeLab];
    self.tableView.headerView = headerView;

    //用Autolayout进行页面布局:
    NSDictionary *views = NSDictionaryOfVariableBindings(headerLab,chargeLab);
    NSDictionary *metrics = @{@"padding":@10,@"maxpadding":@30,@"padding_50":@50};
    
    //设置左右边距
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-padding-[headerLab]" options:0 metrics:metrics views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[chargeLab]-padding-|" options:0 metrics:metrics views:views]];
    
    // 设置垂直方向的边距
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-padding-[headerLab]" options:0 metrics:metrics views:views]];
    [headerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[chargeLab]-padding-|" options:0 metrics:metrics views:views]];

}


@end
