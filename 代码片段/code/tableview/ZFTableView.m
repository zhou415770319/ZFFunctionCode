//
//  ZFTableView.m
//  代码片段
//
//  Created by w on 16/5/24.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFTableView.h"

@interface ZFTableView()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ZFTableView


- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
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
    
    float height = 10;
    if (self.heightForHeader) {
        height =self.heightForHeader;
    }
    
    return height;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZFTableViewCellModel *cellInfo = self.cellInfos[indexPath.row];
    
    ZFTableViewCell *cell = nil;
    
    if (cell ==nil) {
        if (cellInfo.cellName) {//如果cellNmae存在
            //取出已注册的cell
            cell = [tableView dequeueReusableCellWithIdentifier:cellInfo.cellName forIndexPath:indexPath];
        }else if (cellInfo.xibCellName){//如果XibcellNmae存在
            //取出已注册的cell
            
            cell = [tableView dequeueReusableCellWithIdentifier:cellInfo.xibCellName forIndexPath:indexPath];
        }else{
            
            cell = [[ZFTableViewCell alloc] initWithStyle:!cellInfo.tableViewCellStyle? UITableViewCellStyleDefault:cellInfo.tableViewCellStyle reuseIdentifier:@"cell"];
            if (cellInfo.title) {
                cell.textLabel.text =cellInfo.title;

            }
            if (cellInfo.des) {
                cell.detailTextLabel.text = cellInfo.des;
            }
            if (cellInfo.imgName) {
                cell.imageView.image =[UIImage imageNamed:cellInfo.imgName];
            }
//            cell.backgroundColor =[UIColor redColor];
#warning cell的Frame设置
            
            UIView *v =[[UIView alloc]initWithFrame:CGRectMake(10, cell.frame.size.height+15, cell.frame.size.width+32, 1)];
            v.backgroundColor = [UIColor darkGrayColor];
            [cell.contentView addSubview:v];
            
        }
    }
    
    cell.cellInfo = cellInfo;
    return cell;
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取消选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    ZFTableViewCellModel *cellInfo = self.cellInfos[indexPath.row];
    //选择行，如果存在PopToViewController 且对应的class文件已创建则跳转到对应界面
    if (cellInfo.PopToViewController) {
        if (NSClassFromString(cellInfo.PopToViewController)) {
            UIViewController *pop =[[NSClassFromString(cellInfo.PopToViewController) alloc] init];
            pop.title = cellInfo.PopToViewController;
            [[self viewController].navigationController pushViewController:pop animated:YES];
        }
    }
    
}

//获取view所在的Controller
- (UIViewController *)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}

@end
