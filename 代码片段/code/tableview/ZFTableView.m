//
//  ZFTableView.m
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFTableView.h"
#import "ZFTableViewCellModel.h"
@interface ZFTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFTableView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        //去除分割线
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.delegate =self;
        self.dataSource =self;
        
    }
    return self;
}

-(void)setCellInfos:(NSArray *)cellInfos{
    
    if (_cellInfos !=cellInfos) {
        _cellInfos =cellInfos;
        //cellName 注册
        NSMutableArray *arr =[NSMutableArray arrayWithCapacity:1];
        for (ZFTableViewCellModel *cellInfo in _cellInfos) {
            if (cellInfo.cellName) {
                [arr addObject:cellInfo.cellName];
            }
        }
        NSSet *set = [NSSet setWithArray:arr];
        for (NSString * s1 in set) {
            [self registerClass:[NSClassFromString(s1) class] forCellReuseIdentifier:s1];
        }
        
        //xibcellName 注册
        NSMutableArray *xibArr =[NSMutableArray arrayWithCapacity:1];
        
        for (ZFTableViewCellModel *cellInfo in _cellInfos) {
            if (cellInfo.xibCellName) {
                [xibArr addObject:cellInfo.xibCellName];
            }
        }
        
        NSSet *xibSet = [NSSet setWithArray:xibArr];
        for (NSString * s1 in xibSet) {
            [self registerNib:[UINib nibWithNibName:s1 bundle:nil] forCellReuseIdentifier:s1];
        }
        
    }
    

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    if (self.isMoreSection) {
        return self.cellInfos.count;
    }
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.isMoreSection) {
        return [self.cellInfos[section] count];
    }
    
    return self.cellInfos.count;
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    float height = 60 ;
    if (self.heightForRow) {
        height =self.heightForRow;
    }
    
    return height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    float height = 20;
    if (self.heightForHeader) {
        height =self.heightForHeader;
    }
    
    return height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    
    if (cell ==nil) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        if (![[self.cellInfos[indexPath.section][indexPath.row] objectForKey:@"image"] isEqual:[NSNull null]]) {
            cell.imageView.image =[UIImage imageNamed:[self.cellInfos[indexPath.section][indexPath.row] valueForKey:@"image"]];
        }
        
        cell.textLabel.text =[self.cellInfos[indexPath.section][indexPath.row] valueForKey:@"text"];
        cell.detailTextLabel.text =[self.cellInfos[indexPath.section][indexPath.row] valueForKey:@"detailText"];
        
    }
    UIView *v =[UIView new];
    [cell.contentView addSubview:v];
    v.backgroundColor =[UIColor darkGrayColor];
    float vHeight =[self tableView:tableView heightForRowAtIndexPath:indexPath]-1;
    if (self.heightForRow) {
        vHeight = self.heightForRow-1;
    }
    v.frame =CGRectMake(0, vHeight, cell.bounds.size.width, 1);
    
    return cell;
    
}

@end
