//
//  selectTableViewController.m
//  代码片段
//
//  Created by w on 16/5/18.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "selectTableViewController.h"

@interface selectTableViewController ()

@property(nonatomic,retain)NSMutableArray *dataArr;

@end

@implementation selectTableViewController

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithCapacity:1];
        
        [_dataArr addObjectsFromArray:@[@"ZFCollectionViewLayoutCircleType",@"ZFCollectionViewLayoutStackType",@"ZFCollectionViewFlowLayoutRotatePageType",@"ZFCollectionViewFlowLayoutWaterfallType",@"ZFCollectionViewFlowLayoutLineType"]];
        
    }
    return _dataArr;
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];

}

-(void)viewDidDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    UITableViewCell *cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = self.dataArr[indexPath.row];
    
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Class class = NSClassFromString([NSString stringWithFormat:@"%@ViewController",self.dataArr[indexPath.item]]);
    UIViewController *vc = [[class alloc] init];
    vc.title =self.dataArr[indexPath.item];
//    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:NO];
    
}


@end
