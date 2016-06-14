//
//  ZFCollectionView.m
//  代码片段
//
//  Created by w on 16/5/16.
//  Copyright © 2016年 ZF. All rights reserved.
//

#import "ZFCollectionView.h"
#import "ZFCollectionViewCell.h"
#import "ZFCollectionViewCellModel.h"
@interface ZFCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>


@end

@implementation ZFCollectionView

-(instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout{
    
    self = [super initWithFrame:frame collectionViewLayout:layout];
    
    self.delegate = self;
    
    self.dataSource = self;
    
    return self;
}
//设置layout方式
-(void)setLayout:(UICollectionViewLayout *)layout{
    
    self.collectionViewLayout = layout;
    [self layoutIfNeeded];
}


-(void)setCellInfos:(NSMutableArray *)cellInfos{
    if (_cellInfos !=cellInfos) {
        _cellInfos =cellInfos;
        //cellName 注册
        NSMutableArray *arr =[NSMutableArray arrayWithCapacity:1];
        for (ZFCollectionViewCellModel *cellInfo in _cellInfos) {
            if (cellInfo.cellName) {
                [arr addObject:cellInfo.cellName];
            }
        }
        NSSet *set = [NSSet setWithArray:arr];
        for (NSString * s1 in set) {
            [self registerClass:[NSClassFromString(s1) class] forCellWithReuseIdentifier:s1];
        }
        
        //xibcellName 注册
        NSMutableArray *xibArr =[NSMutableArray arrayWithCapacity:1];
        
        for (ZFCollectionViewCellModel *cellInfo in _cellInfos) {
            if (cellInfo.xibCellName) {
                [xibArr addObject:cellInfo.xibCellName];
            }
        }
        
        NSSet *xibSet = [NSSet setWithArray:xibArr];
        for (NSString * s1 in xibSet) {
            [self registerNib:[UINib nibWithNibName:s1 bundle:nil] forCellWithReuseIdentifier:s1];
            //            [self registerClass:[NSClassFromString(s1) class] forCellWithReuseIdentifier:s1];
        }
        
    }
    
}

//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//
//    return 1;
//}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.cellInfos.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ZFCollectionViewCellModel *cellInfo = self.cellInfos[indexPath.item];
    
    ZFCollectionViewCell *cell = nil;
    
    if (cell == nil) {
        
        if (cellInfo.cellName) {//如果cellNmae存在
            //取出已注册的cell
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellInfo.cellName forIndexPath:indexPath];
        }else if (cellInfo.xibCellName){//如果XibcellNmae存在
            //取出已注册的cell
            
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellInfo.xibCellName forIndexPath:indexPath];
        }
        
    }
    
    cell.cellInfo = cellInfo;
    return cell;
    
}

#pragma mark - <UICollectionViewDelegate>

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ZFCollectionViewCellModel *cellInfo = self.cellInfos[indexPath.item];
    [self.cellInfos removeObjectAtIndex:indexPath.item];
    [self.cellInfos addObject:cellInfo];
    //    [self.cellInfos insertObject:cellInfo atIndex:0];
    [collectionView reloadData];
    
}


//-(BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return YES;
//    
//}
//
////拖动
//-(void)moveItemAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath{
//    ZFCollectionViewCellModel *cellInfo = self.cellInfos[indexPath.item];
//    
//    [self.cellInfos removeObjectAtIndex:indexPath.item];
//    [self.cellInfos insertObject:cellInfo atIndex:newIndexPath.item];
//    
//}
//
//-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
//    ZFCollectionViewCellModel *cellInfo = self.cellInfos[sourceIndexPath.item];
//    
//    [self.cellInfos removeObjectAtIndex:sourceIndexPath.item];
//    [self.cellInfos insertObject:cellInfo atIndex:destinationIndexPath.item];
//    
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
